import 'dart:developer' as developer;
import 'dart:io';

import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/features/profile/data/profile_dto.dart';
import 'package:app_demo/src/features/profile/data/profile_repository.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/features/statistics/data/repository/user_stats_repo.dart';
import 'package:app_demo/src/features/statistics/domain/user_stats_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider(ProfileService.new);

class ProfileService {
  final Ref _ref;
  ProfileService(this._ref);
  late final _repo = _ref.read(profileRepositoryProvider);
  late final _userStatsRepo = _ref.read(userStatsRepoProvider);
  String get _currentUserId => _ref.read(currentUserIdProvider);

  Future<bool> hasProfile(String userId) async {
    if (userId.isEmpty) {
      return false;
    }
    return _repo.hasProfile(userId: userId);
  }

  Future<Either<AppException, ProfileModel>> createNewProfile(
    ProfileModel profile,
  ) async {
    if (profile.userId.isEmpty) {
      return Either.left(
        AppException.errorWithMessage('Không tìm thấy id người dùng'),
      );
    }

    final result = await _repo.createProfile(
      userId: profile.userId,
      userName: profile.userName,
      gender: profile.gender,
      dayOfBirth: profile.dayOfBirth,
      avatarUrl: profile.avatarUrl ?? '',
    );

    return result.fold(
      ifLeft: (e) {
        developer.log('ProfileService: createNewProfile failed', error: e);
        return e.left();
      },
      ifRight: (created) async {
        // Initialize user_stats once after profile creation (idempotent upsert).
        final initResult = await _userStatsRepo.updatedUserStats(
          userStats: UserStatsModel(
            userId: created.userId,
            streakCount: 0,
            totalPoints: 0,
          ),
        );
        return initResult.fold(
          ifLeft: (e) {
            developer.log('ProfileService: init user_stats failed', error: e);
            return e.left();
          },
          ifRight: (_) => created.right(),
        );
      },
    );
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
      ifRight: (data) {
        if (data == null) {
          return AppException.badRequest('Hồ sơ cá nhân chưa được tạo.').left();
        }
        return data.toDomain().right();
      },
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

  Future<Either<AppException, ProfileModel>> updateProfileAvatar(
    File imageFile,
  ) async {
    if (_currentUserId.isEmpty) {
      return Either.left(AppException.errorWithMessage('Không tìm thấy user'));
    }
    final result = await _repo.uploadProfileAvatar(
      userId: _currentUserId,
      imageFile: imageFile,
    );
    return result.fold(
      ifLeft: (e) {
        developer.log('ProfileService: updateProfileAvatar failed', error: e);
        return e.left();
      },
      ifRight: (profile) => profile.right(),
    );
  }
}
