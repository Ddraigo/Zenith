import 'dart:developer' as developer;

import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/features/profile/data/profile_repository.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider(ProfileService.new);

class ProfileService {
  final Ref _ref;
  ProfileService(this._ref);
  late final _repo = _ref.read(profileRepositoryProvider);
  String get _currentUserId => _ref.read(currentUserIdProvider);

  Future<ProfileModel> createNewProfile(ProfileModel profile) async {
    if (profile.userId.isEmpty) {
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

  Future<Either<AppException, ProfileModel>> getUserProfile() async {
    if (_currentUserId.isEmpty) {
      return Either.left(AppException.errorWithMessage('Không tìm thấy user'));
    }
    final result = await _repo.getUserProfile(userId: _currentUserId);
    return result.fold(
      ifLeft: (e) {
        developer.log('ProfileService: getUserProfile failed', error: e);
        return e.left();
      },
      ifRight: (data) => data.right(),
    );
  }

  Future<Either<AppException, ProfileModel>> updateUserProfile({
    required ProfileModel userProfile,
  }) async {
    if (_currentUserId.isEmpty) {
      return Either.left(AppException.errorWithMessage('Không tìm thấy user'));
    }
    if (userProfile.userName.isEmpty) {
      return Either.left(
        AppException.errorWithMessage('Tên tài khoản không được để trống'),
      );
    }
    final birthday = Format.formatDMY(userProfile.dayOfBirth);
    if (birthday.isEmpty) {
      return Either.left(
        AppException.errorWithMessage('Ngày sinh không được để trống'),
      );
    }
    return _repo.editUserProfile(
      userProfile: ProfileModel(
        userId: _currentUserId, 
        userName: userProfile.userName, 
        gender: userProfile.gender, 
        dayOfBirth: userProfile.dayOfBirth,
        avatarUrl: userProfile.avatarUrl
      )
    );
  }
}
