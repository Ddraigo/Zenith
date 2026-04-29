
import 'package:app_demo/src/features/authentication/data/repository/token_repository.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenServiceProvider = Provider(TokenService.new);

class TokenService{
  TokenService(this._ref);

  final Ref _ref;
  late final _client = _ref.read(supabaseClientProvider);
  late final _tokenLocalRepo = _ref.read(tokenLocalRepoProvider);


  Future<bool> remove() async{
    final result = await _tokenLocalRepo.removeToken();
    return result.fold(
      ifLeft: (e) => throw e, 
      ifRight: (result)=> result,
    );
  }

  Future<bool> saveToken(Token token) async{
   final result = await _tokenLocalRepo.saveToken(token);
    return result.fold(
      ifLeft: (e) => throw e, 
      ifRight: (result)=> result,
    );
  }

  Future<Token?> fetchToken() async{
    final sessionToken = _client.auth.currentSession?.accessToken;
    if(sessionToken != null && sessionToken.isNotEmpty){
      final token = Token(token: sessionToken);
      final saveResult = await _tokenLocalRepo.saveToken(token);
      saveResult.fold(
        ifLeft: (e) => throw e, 
        ifRight: (_){}
      );
      return token;
    }

    final localResult = await _tokenLocalRepo.fetchToken();
    return localResult.fold(
      ifLeft: (e) => throw e, 
      ifRight: (token) => token,
    );
  }
  

}