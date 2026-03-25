
import 'package:app_demo/src/features/profile/data/profile_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final source = ref.watch(profileSourceProvider);
  return ProfileRepository(source);
});

class ProfileRepository {
  final ProfileSource _ref;

  ProfileRepository(this._ref);

  
  Future<void> createProfile({
    required String userId,
    required String userName,
    required String? avatarUrl,
    required String gender,
    required DateTime dayOfBirth,
  }) {
    return _ref.createProfile(
      userId: userId, 
      userName: userName, 
      avatarUrl: avatarUrl!,
      gender: gender, 
      dayOfBirth: dayOfBirth);
  }
  

}