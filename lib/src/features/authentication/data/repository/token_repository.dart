


import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  throw UnimplementedError();
  } 
);

abstract class TokenRepository {
  Future<void> remove();
  Future<void> saveToken(Token token);
  Future<Token?> fetchToken();
}






