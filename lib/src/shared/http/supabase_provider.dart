

import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

class SupabaseErrorHandle {
  static AppException handle(Object error){
    if( error is AuthApiException){
      final code = error.code;

      switch (code) {
        case 'invalid_credentials':
          return const AppException.unauthorized();
          
        case 'email_exists':
        case 'user_already_exists':
          return const AppException.badRequest('Email đã được đăng ký');
        
        case 'email_not_confirmed':
          return const AppException.badRequest('Vui lòng xác thực email');

        case 'session_expired':
          return const AppException.unauthorized();
        
        case 'over_request_rate_limit':
          return const AppException.server('Bạn thao tác quá nhanh, thử lại sau');
        default:
          return AppException.errorWithMessage(error.message);
      }
    }

    if(error is AuthException){
      return  AppException.errorWithMessage(error.message);
    }

    if(error is AuthInvalidJwtException || error is AuthSessionMissingException){
      return const AppException.unauthorized();
    }

    if(error is AuthRetryableFetchException){
      return const AppException.connectivity();
    }

    if(error is PostgrestException){
      return AppException.errorWithMessage(error.message);
    }

    return const AppException.unknown();
  }
}













