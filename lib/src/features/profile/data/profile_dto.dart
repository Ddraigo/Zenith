
import 'package:app_demo/src/features/profile/domain/profile_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_dto.freezed.dart';
part 'profile_dto.g.dart';

@freezed
abstract class ProfileDTO with _$ProfileDTO{
  const factory ProfileDTO({
    @JsonKey(name: 'id')
    required String userId,

    @JsonKey(name: 'user_name')
    required String userName,

    @JsonKey(name: 'avatar_url')
    String? avatarUrl,
    
    @JsonKey(name: 'gender')
    required String gender,

    @JsonKey(name: 'birthday')
    required DateTime dayOfBirth,

    @JsonKey(name: 'created_at')
    required DateTime createdAt,

    @JsonKey(name: 'updated_at')
    required DateTime updatedAt,
    
  }) = _ProfileDTO;

  factory ProfileDTO.fromJson(Map<String, dynamic> json) => _$ProfileDTOFromJson(json);
}


extension ProfileDTOMapper on ProfileDTO {
  ProfileModel toDomain() {
    return ProfileModel(
      userId: userId,
      userName: userName,
      avatarUrl: avatarUrl,
      gender: gender,
      dayOfBirth: dayOfBirth,
    );
  }
}