import 'dart:developer' as developer;

import 'package:app_demo/src/core/service/device_service.dart';
import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/features/authentication/data/repository/auth_repository.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/features/profile/application/profile_service.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
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
  Future<void> login(String email, String password) async {
    try {
      await _repo.login(email: email, password: password);
      final session = _client.auth.currentSession;

      if (session == null) {
        throw const AppException.errorWithMessage('Session is null');
      }

      await _tokenService.saveToken(Token(token: session.accessToken));

      final userId = _client.auth.currentUser?.id;
      if (userId == null) {
        throw const AppException.errorWithMessage('User id null');
      }

      final vapidKey = dotenv.env['FCM_VAPID_KEY'];
      try {
        await _userDevice.setupFcmToken(
          userId: userId,
          vapidKey: vapidKey,
          subscribeToRefresh: true,
        );
      } catch (e) {
        developer.log(
          'AuthService: setupFcmToken failed after login',
          error: e,
          stackTrace: StackTrace.current,
        );
      }
    } on AppException {
      rethrow;
    } catch (e, st) {
      developer.log(
        'AuthService: login unexpected error',
        error: e,
        stackTrace: st,
      );
      throw const AppException.unknown();
    }
  }

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
    required DateTime dayOfBirth,
    required String gender,
  }) async {
    try {
      final user = await _ref
          .read(authRepositoryProvider)
          .signUp(email: email, password: password);

      final genderCheck = gender.trim().isEmpty ? 'none' : gender;

      final profile = ProfileModel(
        userId: user.id,
        userName: userName,
        dayOfBirth: dayOfBirth,
        gender: genderCheck,
      );

      await _ref.read(profileServiceProvider).createNewProfile(profile);
      final token = _client.auth.currentSession?.accessToken;

      if (token != null) {
        await _tokenService.saveToken(Token(token: token));
      }

      final vapidKey = dotenv.env['FCM_VAPID_KEY'];
      try {
        await _userDevice.setupFcmToken(
          userId: user.id,
          vapidKey: vapidKey,
          subscribeToRefresh: false,
        );
      } catch (e) {
        developer.log(
          'AuthService: setupFcmToken failed after signup',
          error: e,
          stackTrace: StackTrace.current,
        );
      }
    } on AppException {
      rethrow;
    } catch (e, st) {
      developer.log(
        'AuthService: signUp unexpected error',
        error: e,
        stackTrace: st,
      );
      throw const AppException.unknown();
    }
  }

  Future<void> signOut() async {
    final userId = _client.auth.currentUser?.id;

    if (userId != null) {
      await _userDevice.cleanupDeviceTokenOnSignOut(userId: userId);
    } else {
      _userDevice.dispose();
    }

    await _repo.signOut();
    await _tokenService.remove();
  }
}
