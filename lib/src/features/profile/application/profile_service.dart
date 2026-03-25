import 'package:app_demo/src/features/authentication/domain/user_model.dart';
import 'package:app_demo/src/features/authentication/presentation/state/sign_up_state.dart';
import 'package:app_demo/src/features/profile/data/profile_repository.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  final repo = ref.watch(profileRepositoryProvider);
  return ProfileService(repo);
});

class ProfileService {
  ProfileRepository _repo;
  ProfileService(this._repo);

  Future<ProfileModel> createNewProfile(ProfileModel profile) async {

    if(profile.dayOfBirth == null){
      throw AppException.errorWithMessage('dayOfBirth is null');
    }

    await _repo.createProfile(
      userId: profile.userId,
      userName: profile.userName!,
      gender: profile.gender ?? Gender.none.toString(),
      dayOfBirth: profile.dayOfBirth!,
      avatarUrl: profile.avatarUrl ?? '',
    );

    return profile;
  }
}
