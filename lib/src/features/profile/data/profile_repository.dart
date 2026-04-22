
import 'package:app_demo/src/features/profile/data/profile_dto.dart';
import 'package:app_demo/src/features/profile/data/profile_source.dart';
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
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
    required String? gender,
    required DateTime dayOfBirth,
  }) {
    return _ref.createProfile(
      userId: userId, 
      userName: userName, 
      avatarUrl: avatarUrl ?? '',
      gender: gender ?? 'none', 
      dayOfBirth: dayOfBirth);
  }

  Future<Either<AppException, ProfileModel>> getUserProfile({required String userId})async{
    final result = await _ref.getUserProfile(userId: userId);
    return  result.fold(
      ifLeft: (e) => e.left(), 
      ifRight: (dto) => dto.toDomain().right(),
    );
  }

  Future<Either<AppException, ProfileModel>> editUserProfile({
    required ProfileModel userProfile,
  })async{
    final now = DateTime.now();
    final result = await _ref.editUserProfile(
      user: ProfileDTO(
        userId: userProfile.userId, 
        userName: userProfile.userName, 
        gender: userProfile.gender, 
        dayOfBirth: userProfile.dayOfBirth, 
        updatedAt: now,
        ),
      );
    return result.fold(
      ifLeft: (e) => e.left(), 
      ifRight: (dto) => dto.toDomain().right(),
    );
  }

}