import 'dart:developer' as developer;

import 'package:app_demo/src/core/service/device_service.dart';
import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/features/authentication/data/repository/auth_repository.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/features/profile/application/profile_service.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/sentry_reporter.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:app_demo/src/shared/utils/helper_function.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final authServiceProvider = Provider(AuthService.new);

class AuthService {
  AuthService(this._ref);
  final Ref _ref;
  late final AuthRepository _repo = _ref.read(authRepositoryProvider);
  late final TokenService _tokenService = _ref.read(tokenServiceProvider);
  late final SupabaseClient _client = _ref.read(supabaseClientProvider);
  late final UserDeviceService _userDevice = _ref.read(userDeviceService);

  void _reportAuthError(
    Object error,
    StackTrace stackTrace, {
    required String action,
    String? flow,
    Map<String, dynamic>? extra,
  }) {
    SentryReporter.captureException(
      error,
      stackTrace: stackTrace,
      tags: {
        'feature': 'auth',
        'layer': 'service',
        'action': action,
        'flow': ?flow,
      },
      context: {
        'auth_context': {
          'feature': 'auth',
          'action': action,
          'flow': ?flow,
          if (extra != null) ...extra,
        },
      },
    );
  }

  Future<void> login(String email, String password) async {
    _validateLoginInput(email, password);
    try {
      await _repo.login(email: email.trim(), password: password.trim());
      final session = _client.auth.currentSession;

      if (session == null) {
        throw const AppException.errorWithMessage('Không tìm thấy phiên đăng nhập');
      }
      

      await _tokenService.saveToken(Token(token: session.accessToken));

      final userId = _client.auth.currentUser?.id;
      if (userId == null) {
        throw const AppException.errorWithMessage('Không tìm thấy users');
      }
      SentryReporter.setUser(id: userId, email: MyHelper.maskEmail(email));
      await _setupUserFCM(userId: userId, subscribeToRefresh: true);
    } on AppException {
      rethrow;
    } catch (e, st) {
      _reportAuthError(
        e,
        st,
        action: 'login',
        extra: {'email': MyHelper.maskEmail(email)},
      );
      throw const AppException.unknown();
    }
  }

  Future<void> _setupUserFCM({
    required String userId,
    required bool subscribeToRefresh,
  }) async {
    final vapidKey = dotenv.env['FCM_VAPID_KEY'];
    if (vapidKey == null || vapidKey.isEmpty) {
      developer.log('FCM_VAPID_KEY is not configured');
      return;
    }
    try {
      await _userDevice.setupFcmToken(
        userId: userId,
        vapidKey: vapidKey,
        subscribeToRefresh: subscribeToRefresh,
      );
    } catch (e, st) {
      _reportAuthError(
        e,
        st,
        action: 'setup_fcm',
        extra: {'user_id': userId},
      );
    }
  }

  void _validateLoginInput(String email, String password) {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw const AppException.badRequest('Email và mật khẩu không hợp lệ');
    }
    if (!Validator.isValidEmail(email)) {
      throw const AppException.badRequest('Email không hợp lệ');
    }
    if (!Validator.isValidPassword(password)) {
      throw const AppException.badRequest('Mật khẩu không hợp lệ');
    }
  }

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
    required DateTime dayOfBirth,
    required String gender,
  }) async {
    _validateLoginInput(email, password);
    _validateSignUpInput(
      userName: userName,
      dayOfBirth: dayOfBirth,
      gender: gender,
    );

    try {
      final user = await _repo.signUp(
        email: email.trim(),
        password: password.trim(),
      );

      final profile = ProfileModel(
        userId: user.id,
        userName: userName.trim(),
        dayOfBirth: dayOfBirth,
        gender: gender.trim(),
      );

      final profileResult = await _ref
          .read(profileServiceProvider)
          .createNewProfile(profile);
      profileResult.fold(ifLeft: (e) => throw e, ifRight: (_) {});

      final token = _client.auth.currentSession?.accessToken;
      if (token != null && token.isNotEmpty) {
        await _tokenService.saveToken(Token(token: token));
      }

      await _setupUserFCM(userId: user.id, subscribeToRefresh: true);
    } on AppException {
      rethrow;
    } catch (e, st) {
      _reportAuthError(
        e, st, action: 'sign_up',
        flow: 'setup_user_fcm',
      );
      
    }
  }

  void _validateSignUpInput({
    required String userName,
    required DateTime dayOfBirth,
    required String gender,
  }) {
    if (userName.trim().isEmpty) {
      throw const AppException.badRequest('Tên người dùng đang trống');
    }
    if (!Validator.isValidDayOfBirth(dayOfBirth)) {
      throw const AppException.badRequest('Ngày sinh không hợp lệ');
    }
    if (gender.trim().isEmpty) {
      throw const AppException.badRequest('Giới tính đang trống');
    }
  }

  Future<void> signOut() async {
    try {
      final userId = _client.auth.currentUser?.id;

      if (userId != null) {
        try {
          await _userDevice.cleanupDeviceTokenOnSignOut(userId: userId);
        } catch (e, st) {
          _reportAuthError(
            e,
            st,
            action: 'sign_out',
            flow: 'cleanup_device_token_on_sign_out',
          );
        }
      } else {
        _userDevice.dispose();
      }
      try {
        await _repo.signOut();
        SentryReporter.clearUser();
      } catch (e, st) {
        _reportAuthError(
          e,
          st,
          action: 'sign_out',
          flow: 'repo_sign_out',
        );
      }
      await _tokenService.remove();
    } catch (e, st) {
      _reportAuthError(e, st, action: 'sign_out');
      throw const AppException.unknown();
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    _validateChangePasswordInput(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    try {
      await _repo.changePassword(
        currentPassword: currentPassword.trim(),
        newPassword: newPassword.trim(),
      );
    } on AppException {
      rethrow;
    } catch (e, st) {
      _reportAuthError(e, st, action: 'change_password');
      throw const AppException.unknown();
    }
  }

  void _validateChangePasswordInput({
    required String currentPassword,
    required String newPassword,
  }) {
    if (!Validator.isValidPassword(currentPassword)) {
      throw const AppException.badRequest('Mật khẩu hiện tại không hợp lệ');
    }
    if (!Validator.isValidPassword(newPassword)) {
      throw const AppException.badRequest('Mật khẩu mới không hợp lệ');
    }
    if (currentPassword.trim() == newPassword.trim()) {
      throw const AppException.badRequest('Mật khẩu mới phải khác mật khẩu cũ');
    }
  }

  Future<Either<AppException, bool>> sendOtpEmail({required String email})async {

    if (email.isEmpty || !Validator.isValidEmail(email)) {
      return Either.left(const AppException.badRequest('Email không hợp lệ'));
    }
    try {
      await _repo.sendOtpEmail(email: email);
      return Either.right(true);
    } on AppException catch (e) {
      return Either.left(e);
    } catch (e, st) {
      _reportAuthError(
        e,
        st,
        action: 'send_otp_email',
        extra: {'email': MyHelper.maskEmail(email)},
      );
      return Either.left(const AppException.unknown());
    }
  }

  Future<Either<AppException, bool>> resetPassWithOtp({
    required String email,
    required String otp,
    required String newPass,
  }) async{

    if (email.isEmpty || !Validator.isValidEmail(email)) {
      return Either.left(const AppException.badRequest('Email không hợp lệ'));
    }
    if (otp.length < 6) {
      return Either.left(const AppException.badRequest('Mã xác nhận không hợp lệ'));
    }
    if (!Validator.isValidPassword(newPass)) {
      return Either.left(const AppException.badRequest('Mật khẩu không hợp lệ'));
    }
    try {
      await _repo.verifyOtp(email: email, token: otp);
      await _repo.resetPassword(newPass: newPass);
      return Either.right(true);
    } on AppException catch (e){
      return Either.left(e);
    } catch (e, st) {
      _reportAuthError(
        e,
        st,
        action: 'reset_pass_with_otp',
        extra: {'email': MyHelper.maskEmail(email)},
      );
      return Either.left(const AppException.unknown());
    }
  }  
}
