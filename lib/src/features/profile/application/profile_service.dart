import 'dart:developer' as developer;

import 'package:app_demo/src/features/profile/data/profile_repository.dart';
import 'package:app_demo/src/features/profile/data/profile_source.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/http/supabase_provider.dart';

final profileServiceProvider = Provider(ProfileService.new);

class ProfileService {
  
  final Ref _ref;
  ProfileService(this._ref);
  late final _repo = _ref.read(profileRepositoryProvider);
  late final _client = _ref.read(supabaseClientProvider);


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
