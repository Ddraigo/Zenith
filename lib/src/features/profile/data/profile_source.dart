import 'package:app_demo/src/features/profile/data/profile_dto.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final profileSourceProvider = Provider<ProfileSource>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return ProfileSource(client);
});

class ProfileSource {
  final SupabaseClient _client;

  ProfileSource(this._client);

  Future<ProfileDTO> createProfile({
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
      return ProfileDTO.fromJson(data);
    } catch (e) {
      throw SupabaseErrorHandle.handle(e);
    }
  }
}
