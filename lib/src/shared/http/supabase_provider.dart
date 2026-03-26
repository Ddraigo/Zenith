
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

class SupabaseErrorHandle {
  static AppException handle(dynamic error){
    if( error is AuthException){
      return AppException.errorWithMessage(error.message);
    }
    if(error is PostgrestException){
      return AppException.errorWithMessage(error.message);
    }
    return const AppException.error();
  }
}













