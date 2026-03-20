

import 'package:app_demo/src/features/authentication/presentation/state/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> login(String email, String password);
  Future<AuthState> signUp(String userName, String email, String password);
}





