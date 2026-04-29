import 'package:app_demo/src/features/authentication/data/source/token_local_source.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


abstract class TokenRepository {
  Future<Either<AppException, bool>> removeToken();
  Future<Either<AppException, bool>> saveToken(Token token);
  Future<Either<AppException, Token?>> fetchToken();
}

final tokenLocalRepoProvider = Provider<TokenLocalRepo>((ref) 
  => TokenLocalRepo(ref.read(tokenLocalSourceProvider))
);

class TokenLocalRepo implements TokenRepository {
  TokenLocalRepo(this._source);
  final TokenLocalSource _source;

  @override
  Future<Either<AppException, Token?>> fetchToken() async {
    final result = await _source.fetchToken();
    return result.fold(
      ifLeft: (e) =>  Either.left(e),
      ifRight: (token){
        if(token == null || token.isEmpty){
          return Either.right(null);
        }
        return Either.right(Token(token: token));
      },
    );
  }

  @override
  Future<Either<AppException, bool>> removeToken() async {
    final result = await _source.removeToken();
    return result.fold(
      ifLeft: (e) =>  Either.left(e),
      ifRight: (result) => Either.right(result),
    );
  }

  @override
  Future<Either<AppException, bool>> saveToken(Token token) async {
    final result = await _source.saveToken(token.token);
    return result.fold(
      ifLeft: (e) => Either.left(e),
      ifRight: (result) =>  Either.right(result),
    );
  }
}
