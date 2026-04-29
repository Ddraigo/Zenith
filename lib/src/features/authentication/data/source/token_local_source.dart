
import 'package:app_demo/src/shared/constants/store_key.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final tokenLocalSourceProvider = Provider<TokenLocalSource>((ref){
  return TokenLocalSource();
});

class TokenLocalSource {
  TokenLocalSource({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<Either<AppException, bool>> saveToken(String token) async {
    try {
      await _storage.write(key: StoreKey.token.toString(), value: token);
      return Either.right(true);
    } catch (e) {
      return Either.left(
        AppException.errorWithMessage('Save token failed: $e'),
      );
    }
  }

  Future<Either<AppException, String?>> fetchToken() async {
    try {
      final currentToken = await _storage.read(key: StoreKey.token.toString());
      if (currentToken == null || currentToken.isEmpty) {
        return Either.right(null);
      }
      return Either.right(currentToken);
    } catch (e) {
      return Either.left(
        AppException.errorWithMessage('Fetch token failed: $e'),
      );
    }
  }

  Future<Either<AppException, bool>> removeToken() async {
    try {
      await _storage.delete(key: StoreKey.token.toString());

      return const Either.right(true);
    } catch (e) {
      return Either.left(
        AppException.errorWithMessage('Remove token failed: $e'),
      );
    }
  }
}
