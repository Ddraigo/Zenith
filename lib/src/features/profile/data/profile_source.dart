import 'dart:developer' as developer;

import 'package:app_demo/src/features/profile/data/profile_dto.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final profileSourceProvider = Provider<ProfileSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return ProfileSource(client);
});

class ProfileSource {
  final SupabaseClient _client;

  ProfileSource(this._client);

  Future<bool> hasProfile({required String userId}) async {
    try {
      final data = await _client
          .from('profiles')
          .select('id')
          .eq('id', userId)
          .maybeSingle();
      return data != null;
    } catch (e, st) {
      developer.log('ProfileSource: hasProfile error: $e');
      developer.log('$st');
      return false;
    }
  }

  Future<Either<AppException, ProfileDTO>> createProfile({
    required String userId,
    required String userName,
    required String gender,
    required DateTime dayOfBirth,
    String? avatarUrl,
  }) async {
    try {
      final data = await _client
          .from('profiles')
          .insert({
            'id': userId,
            'user_name': userName,
            'gender': gender,
            'avatar_url': avatarUrl,
            'birthday': Format.formatYMD(dayOfBirth),
          })
          .select()
          .single();
      return Either.right(ProfileDTO.fromJson(data));
    } catch (e) {
      throw SupabaseErrorHandle.handle(e);
    }
  }

  Future<Either<AppException, ProfileDTO?>> getUserProfile({
    required String userId,
  })async{
    try {
      developer.log('ProfileSource: getUserProfile called for userId: $userId');
      final data = await _client
                        .from('profiles')
                        .select()
                        .eq('id', userId)
                        .maybeSingle();
      return Either.right(data == null ? null : ProfileDTO.fromJson(data));
    } catch (e, st) {
      developer.log('ProfileSource: getUserProfile error: $e');
      developer.log('$st');
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }

  Map<String, dynamic> _buildPayload(ProfileDTO userProfile){
    final payload = userProfile.toJson();
    payload.removeWhere((_, value) => (value == null || value == ''));
    return payload;
  }

  Future<Either<AppException, ProfileDTO>> editUserProfile({
    required ProfileDTO user
  })async{
    try {
      final request = await _client
                          .from('profiles')
                          .upsert(
                            _buildPayload(user), 
                            onConflict: 'id'
                          )
                          .select()
                          .single();
    return Either.right(ProfileDTO.fromJson(request));
    } catch (e, st) {
      developer.log('ProfileSource: editUserProfile failed: $e');
      developer.log('$st');
      return Either.left(SupabaseErrorHandle.handle(e));
    }
  }
  
}
