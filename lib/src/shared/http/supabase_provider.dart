

import 'dart:developer' as developer;

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

      if(error.code == '42501' ){
        return AppException.permissionDenied('Không có quyền truy cập');
      }
      if(error.code == '23505' || error.code == '23514'){
        return AppException.errorWithMessage('Dữ liệu không hợp lệ');
      }
      if(error.code == '23502'){
        return AppException.errorWithMessage('Thiếu thông tin bắt buộc');
      }
      if(error.code == 'PGRST116'){
        return AppException.errorWithMessage('Không tìm thấy dữ liệu');
      }
      developer.log('PostgrestException: code=${error.code}, message=${error.message}', error: error);

      return AppException.errorWithMessage('Xảy ra lỗi, vui lòng thử lại');
    }

    return const AppException.unknown();
  }
}













