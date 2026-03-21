import 'dart:convert';

import 'package:app_demo/src/features/authentication/data/token_repository.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/shared/constants/store_key.dart';
import 'package:app_demo/src/shared/utils/platform_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tokenServiceProvider = Provider(TokenService.new);

class TokenService implements TokenRepository{
  TokenService(this._ref);

  late final PlatformType _platform = _ref.read(platformTypeProvider);
  final Ref _ref;
  Token? _token;

  @override
  Future<void> remove() async{
    _token = null;
    final prefs = await SharedPreferences.getInstance();

    if(_platform == PlatformType.iOS ||
        _platform == PlatformType.android || 
        _platform == PlatformType.linux){
          const storage = FlutterSecureStorage();

          try {
            await storage.delete(key: StoreKey.token.toString());
          } on Exception catch (e) {}
    }else{
      await prefs.remove(StoreKey.token.toString());
    }

    await prefs.remove(StoreKey.user.toString());
    
  }

  @override
  Future<void> saveToken(Token token) async{
    final prefs = await SharedPreferences.getInstance();

    _token = token;
    if( _platform == PlatformType.iOS ||
    _platform == PlatformType.android ||
    _platform == PlatformType.linux){
      const storage = FlutterSecureStorage();
      try {
        await storage.write(key: StoreKey.token.toString(), value: jsonEncode(_token.toString()));
      } on Exception catch (e) {}
    }else{
      await prefs.setString(StoreKey.token.toString(), jsonEncode(_token.toString()));
    }
  }

  @override
  Future<Token?> fetchToken() async{
    String? tokenValue;

    if(_platform == PlatformType.iOS ||
    _platform == PlatformType.android ||
    _platform == PlatformType.linux){
      const storage = FlutterSecureStorage();
      tokenValue = await storage.read(key: StoreKey.token.toString());
      
    }else{
      final prefs = await SharedPreferences.getInstance(); 
      tokenValue = prefs.getString(StoreKey.token.toString());
    }
    try {
        if(tokenValue != null){
          _token = Token.fromJson(jsonDecode(tokenValue));
        }
      } on Exception catch (e) {
        throw FormatException('');
      }
    return _token;
  }
  

}