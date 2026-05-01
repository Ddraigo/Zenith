import 'package:app_demo/src/features/authentication/data/dto/user_dto.dart';
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
        throw AppException.errorWithMessage('Auth Source: user is null');
      }
      if(user.email == null){
        throw AppException.errorWithMessage('Auth Source: email is null');
      }
      // User.fromJson(response.data)    
      return UserDTO(
        id: user.id ,
        email: user.email!,
        createdAt: DateTime.parse(user.createdAt), 
        
      );
    } on AuthException catch (e) {
      throw SupabaseErrorHandle.handle(e);
    } on AppException{
      rethrow;
    }catch (e){
      rethrow;
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
        throw AppException.errorWithMessage('Auth Source: user is null');
      }
      
      return UserDTO(
        id: user.id,
        email: user.email!,
        createdAt: DateTime.parse(user.createdAt), 

      );
    } on AuthException catch (e) {
      throw SupabaseErrorHandle.handle(e);
    } on AppException{
      rethrow;
    }catch (e){
      rethrow;
    }

  }

  Future<void> signOut() async => await _client.auth.signOut();

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final user = _client.auth.currentUser;
      final email = user?.email;
      if (user == null || email == null || email.isEmpty) {
        throw const AppException.unauthorized();
      }

      await _client.auth.signInWithPassword(
        email: email,
        password: currentPassword,
      );

      await _client.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    } on AuthException catch (e) {
      throw SupabaseErrorHandle.handle(e);
    } on AppException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
