


import 'package:app_demo/src/features/authentication/domain/token_model.dart';

abstract class TokenRepository {
  Future<void> remove();
  Future<void> saveToken(Token token);
  Future<Token?> fetchToken();
}






