import 'package:app_demo/src/features/authentication/data/user_dto.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authSourceProvider = Provider<AuthSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthSource(client);
});

class AuthSource {
  final SupabaseClient _client;

  AuthSource(this._client);

  Future<UserDTO> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;

      if(user == null){
        throw AppException.errorWithMessage('Không tồn người dùng');
      }
      if(user.email == null){
        throw AppException.errorWithMessage('email không tồn tại');
      }
      if(user.createdAt == null){
        throw AppException.errorWithMessage('không tìm thấy ngày tạo');
      }
      return  UserDTO(
        id: user.id ,
        email: user.email!,
        createdAt: DateTime.parse(user.createdAt),
      );
    } catch (e) {
      throw SupabaseErrorHandle.handle(e);
    }
  }

  Future<UserDTO> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if(user == null){
        throw AppException.errorWithMessage('Chưa tạo người dùng');
      }
      if(user.id == null){
        throw AppException.errorWithMessage('Không tìm thấy id người dùng');
      }
      if(user.email == null){
        throw AppException.errorWithMessage('email không tồn tại');
      }
      if(user.createdAt == null){
        throw AppException.errorWithMessage('không tìm thấy ngày tạo');
      }
      
      return UserDTO(
        id: user.id,
        email: user.email!,
        createdAt: DateTime.parse(user.createdAt),
      );
    } catch (e) {
      throw SupabaseErrorHandle.handle(e);
    }
  }

  Future<void> signOut() async => await _client.auth.signOut();
}
