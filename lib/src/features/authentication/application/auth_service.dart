import 'dart:convert';

import 'package:app_demo/src/features/authentication/application/token_service.dart';
import 'package:app_demo/src/features/authentication/data/auth_repository.dart';
import 'package:app_demo/src/features/authentication/domain/token_model.dart';
import 'package:app_demo/src/features/authentication/presentation/state/auth_state.dart';
import 'package:app_demo/src/shared/http/api_provider.dart';
import 'package:app_demo/src/shared/http/api_response.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider(AuthService.new);

class AuthService implements AuthRepository{

  AuthService(this._ref);
  final Ref _ref;
  late final ApiProvider _api = _ref.read(apiProvider);
  
  @override
  Future<AuthState> login(String email, String password) async {
    if(!Validator.isValidPassword(password)){
      return const AuthState.error(
        AppException.errorWithMessage('Minimun 8 characters required'),
      );
    }
    if(!Validator.isValidEmail(email)) {
      return const AuthState.error(
        AppException.errorWithMessage('Please enter a valid email address'),
      );
    }

    final params ={
      'email': email,
      'password': password,
    };

    final loginResponse = await _api.post('login', jsonEncode(params));

    return loginResponse.when(
      success: (success) async{
        final tokenService = _ref.read(tokenServiceProvider);

        final token = Token.fromJson( success as Map<String, dynamic>);
        await tokenService.saveToken(token);
        return const AuthState.loggedIn();
      }, 
      error: (error){
        return AuthState.error(error);
      });
  }
  
  @override
  Future<AuthState> signUp(String userName, String email, String password) async {
    if(!Validator.isValidEmail(email)){
      return const AuthState.error(AppException.errorWithMessage('Please enter a valid email address'));
    }
    if(!Validator.isValidPassword(password)){
      return const AuthState.error(AppException.errorWithMessage('Your password is not valid'));
    }

    final params = {
      'userName': userName,
      'email': email,
      'password': password
    };

    // final newUser =  User(userName : userName, email: email, password: password);

    final loginResponse = await _api.post('sign_up', jsonEncode(params));
    return loginResponse.when(
      success: (success) async{
        final tokenService = _ref.read(tokenServiceProvider);
        final token = Token.fromJson(success as Map<String, dynamic>);

        await tokenService.saveToken(token);
        
        return const AuthState.loggedIn();
      }, 
      error: (error){
        return AuthState.error(error);
      });
  }
}