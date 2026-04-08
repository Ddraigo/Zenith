import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String userId,
    required String userName,
    String? avatarUrl,
    String? gender,
    required DateTime dayOfBirth,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  factory ProfileModel.create({
    required String userId,
    required String userName,
    String? gender,
    required DateTime dayOfBirth,
    String? avatarUrl,
  }) {
    if(userId.trim().isEmpty){
      throw AppException.errorWithMessage('$userId is null or empty');
    }
    if(userName.trim().isEmpty){
      throw AppException.errorWithMessage('$userName is null or empty');
    }
    return ProfileModel(
      userId: userId,
      userName: userName,
      gender: gender,
      dayOfBirth: dayOfBirth,
      avatarUrl: avatarUrl,
    );
  }


}
