

import 'package:app_demo/src/core/data/dto/user_device_dto.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/http/supabase_provider.dart';

final userDeviceSourceProvider = Provider<UserDeviceSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return UserDeviceSource(client);
});

class UserDeviceSource {
  final SupabaseClient _client;

  UserDeviceSource(this._client);
  Future<Either<AppException, List<UserDeviceDTO>>> getUserFcmToken({
    required String userId,
  }) async {
    try {
      final data = await _client
          .from('user_devices')
          .select()
          .eq('user_id', userId) as List<dynamic>;
      return  Either.right(data
                        .map((e) => UserDeviceDTO.fromJson(e as Map<String, dynamic>))
                        .toList());
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  // Future<Either<AppException, bool>> checkUserFcmToken({
  //   required String userId,
  //   required String fcmToken,
  // }) async{
  //   try {
  //     final data = await _client
  //                   .from('user_devices')
  //                   .select()
  //                   .eq('user_id', userId)
  //                   .eq('fcm_token', fcmToken);
  //     if(data.isEmpty){
  //       return Either.right(false);
  //     }
  //     return Either.right(true);
  //   } catch (e) {
  //     return Either.left(SupabaseErrorHandle.handle(e));
  //   }
  // }

  Future<Either<AppException, bool>> updateFcmToken({
    required String userId,
    required String fcmToken,
  }) async {
    try {
      await _client
          .from('user_devices')
          .upsert({
            'fcm_token': fcmToken, 
            'user_id': userId,
          }, onConflict: 'fcm_token');
      return const Either.right(true);
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Future<Either<AppException, bool>> deleteFcmToken({
    required String userId,
    required String fcmToken,
  }) async {
    try {
      await _client
          .from('user_devices')
          .delete()
          .eq('user_id', userId)
          .eq('fcm_token', fcmToken);
      return const Either.right(true);
    } catch (e) {
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }
}