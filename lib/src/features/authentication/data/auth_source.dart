import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authSourceProvider = Provider<AuthSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthSource(client);
});

class AuthSource {
  final SupabaseClient _cilent;

  AuthSource(this._cilent);

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) {
    return _cilent.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUp({
    required String userName,
    required String email,
    required String password,
  }) {
    return _cilent.auth.signUp(
      email: email,
      password: password,
      data: {'userName': userName},
    );
  }


  Future<void> signOut() => _cilent.auth.signOut();
  
}
