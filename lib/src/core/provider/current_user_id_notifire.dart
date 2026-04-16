import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserIdProvider = Provider<String>((ref){
  final client = ref.read(supabaseClientProvider);
  final user = client.auth.currentUser;
  if(user == null) throw const AppException.unauthorized();
  return user.id;
});