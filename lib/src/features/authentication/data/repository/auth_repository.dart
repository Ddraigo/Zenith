import 'package:app_demo/src/features/authentication/data/source/auth_source.dart';
import 'package:app_demo/src/features/authentication/data/dto/user_dto.dart';
import 'package:app_demo/src/features/authentication/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final source = ref.watch(authSourceProvider);
  return AuthRepository(source);
});

class AuthRepository {
  AuthRepository(this._source);
  final AuthSource _source;

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _source.login(email: email, password: password);
    return response.toDomain();
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
  }) async {
    final response = await _source.signUp(email: email, password: password);
    return response.toDomain();
  }

  Future<void> signOut() {
    return _source.signOut();
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) {
    return _source.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
