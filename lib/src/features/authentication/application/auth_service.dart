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
        'Service received invalid email: $email',
      );
    }
    if (!Validator.isValidPassword(password)) {
      throw AppException.errorWithMessage(
        'Service received invalid password: $password',
      );
    }

    try {
      await _repo.login(email: email, password: password);
      final session = _supabaseClient.auth.currentSession;

      if (session == null) {
        throw const AppException.errorWithMessage('Session is null');
      }

      await _tokenService.saveToken(Token(token: session.accessToken));
    } on AuthException catch (e) {
      throw AppException.errorWithMessage(e.toString());
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signUp(
    String userName,
    String email,
    String password,
    String gender,
    DateTime dayOfBirth,
  ) async {
    if (!Validator.isValidEmail(email)) {
      throw AppException.errorWithMessage(
        'Service received invalid email: $email',
      );
    }
    if (!Validator.isValidPassword(password)) {
      throw AppException.errorWithMessage(
        'Service received invalid password: $password',
      );
    }

    try {
      await _repo.signUp(userName: userName.trim(), email: email.trim(), password: password);
      final session = _supabaseClient.auth.currentSession;

      if (session != null) {
        await _tokenService.saveToken(Token(token: session.accessToken));
      }

      final currentUser = _supabaseClient.auth.currentUser?.id;
      if(currentUser == null){
        throw AuthException('currentUser is not found');
      }
      final profile = ProfileModel.create(
        userId: currentUser,
        userName: userName.trim(),
        avatarUrl: '',
        gender: gender,
        dayOfBirth: dayOfBirth,
      );
      late final _profileService = _ref.read(profileServiceProvider);
      await _profileService.createNewProfile(profile);
    } on AuthException catch (e) {
      throw AppException.errorWithMessage(e.toString());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() => _repo.signOut();
}
