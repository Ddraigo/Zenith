import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/features/authentication/data/auth_repository.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/features/profile/application/profile_service.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authServiceProvider = Provider(AuthService.new);

class AuthService {
  AuthService(this._ref);
  final Ref _ref;
  late final AuthRepository _repo = _ref.read(authRepositoryProvider);
  late final TokenService _tokenService = _ref.read(tokenServiceProvider);
  late final SupabaseClient _supabaseClient = _ref.read(supabaseClientProvider);

  Future<void> login(String email, String password) async {
    if (!Validator.isValidEmail(email)) {
      throw AppException.errorWithMessage(
        'Email không hợp lệ: $email',
      );
    }
    if (!Validator.isValidPassword(password)) {
      throw AppException.errorWithMessage(
        'Mật khẩu không hợp lệ: $password',
      );
    }

    try {
      await _repo.login(email: email, password: password);
      final session = _supabaseClient.auth.currentSession;

      if (session == null) {
        throw const AppException.errorWithMessage('Session is null');
      }

      await _tokenService.saveToken(Token(token: session.accessToken));
    } on AppException{
      rethrow;
    }catch(_){
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
    if (!Validator.isValidEmail(email)) {
      throw AppException.errorWithMessage('Invalid email');
    }
    if (!Validator.isValidPassword(password)) {
      throw AppException.errorWithMessage('Invalid password');
    }
    if (!Validator.isValidDayOfBirth(dayOfBirth)) {
      throw AppException.errorWithMessage("Invalid dayOfBirth");
    }

    try {
      final user = await _ref
          .read(authRepositoryProvider)
          .signUp(email: email, password: password);

      
      if (user.id == null) {
        throw AppException.errorWithMessage('Auth Source: userId is null');
      }

      final genderCheck = gender.trim().isEmpty ? 'none' : gender;

      final profile = ProfileModel(
        userId: user.id,
        userName: userName,
        dayOfBirth: dayOfBirth,
        gender: genderCheck,
      );

      await _ref.read(profileServiceProvider).createNewProfile(profile);
    } on AuthException catch (e) {
      throw SupabaseErrorHandle.handle(e);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException.errorWithMessage(e.toString());
    }
  }

  Future<void> signOut() => _repo.signOut();
}
