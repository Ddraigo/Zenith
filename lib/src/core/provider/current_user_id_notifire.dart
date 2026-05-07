import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/profile/presentation/controller/profile_notifier.dart';

final currentUserIdProvider = Provider<String>((ref){
  final client = ref.read(supabaseClientProvider);
  final user = client.auth.currentUser;
  if(user == null) throw const AppException.unauthorized();
  return user.id;
});

final userEmailProvider = Provider<String>((ref){
  final client = ref.read(supabaseClientProvider);
  final userEmail = client.auth.currentUser?.email;
  if(userEmail == null || userEmail.isEmpty) throw const AppException.errorWithMessage('Không tìm thấy email người dùng');
  return userEmail;
});

final userAvatarProvider = FutureProvider<String>((ref)async{
  final profile = await ref.watch(profileProvider.future);
  return profile.avatarUrl ?? '';
});

final userNameProvider = Provider<String>((ref){
  return ref.watch(profileProvider.select(
    (value) => value.value?.userName ?? 'Bạn'
  ));
});