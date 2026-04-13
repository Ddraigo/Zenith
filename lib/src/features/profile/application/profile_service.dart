
import 'package:app_demo/src/features/profile/data/profile_repository.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider(ProfileService.new);

class ProfileService {
  
  final Ref _ref;
  ProfileService(this._ref);
  late final _repo = _ref.read(profileRepositoryProvider);


  Future<ProfileModel> createNewProfile(ProfileModel profile) async {
    
    if(profile.userId.isEmpty){
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
