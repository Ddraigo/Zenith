import 'package:app_demo/src/features/profile/data/profile_repository.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  final repo = ref.watch(profileRepositoryProvider);
  return ProfileService(repo);
});

class ProfileService {
  final ProfileRepository _repo;
  ProfileService(this._repo);

  Future<ProfileModel> createNewProfile(ProfileModel profile) async {
    
    if(profile.userId == null){
      throw AppException.errorWithMessage('$profile.userId is null');
    }

    await _repo.createProfile(
      userId: profile.userId,
      userName: profile.userName,
      gender: profile.gender,
      dayOfBirth: profile.dayOfBirth,
      avatarUrl: profile.avatarUrl ?? '',
    );

    return profile;
  }
}
