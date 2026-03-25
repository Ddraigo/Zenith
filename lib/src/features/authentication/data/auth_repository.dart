

import 'package:app_demo/src/features/authentication/data/auth_source.dart';
import 'package:app_demo/src/features/authentication/data/user_dto.dart';
import 'package:app_demo/src/features/authentication/domain/user_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final source = ref.watch(authSourceProvider);
  return AuthRepository(source);
});

class AuthRepository {
  AuthRepository(this._ref);
  final AuthSource _ref;

  Future<UserModel> login({
    required String email,
    required String password,
  })async{
    try{
      final response = await _ref.login(email: email, password: password);
      return UserDTO.fromAuthResponse(response).toDomain();
    } on AuthException catch (e){
      throw AppException.errorWithMessage(e.message);
    }
  }

  Future<UserModel> signUp({
      required String userName,
      required String email,
      required String password,
    }
  ) async{
    try{
      final response = await _ref.signUp(userName: userName, email: email, password: password);
      final dto = UserDTO.fromAuthResponse(response);
      return dto.toDomain();
    }on AuthException catch (e){
      throw AppException.errorWithMessage(e.message);
    }
  }

  Future<void> signOut(){
    return _ref.signOut();
  }
}





