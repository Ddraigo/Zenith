import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_device_model.dart';
part 'user_device_dto.freezed.dart';
part 'user_device_dto.g.dart';

@freezed
abstract class UserDeviceDTO with _$UserDeviceDTO {
  const factory UserDeviceDTO({
    @JsonKey(name: 'id') required String id,

    @JsonKey(name: 'user_id') required String userId,

    @JsonKey(name: 'fcm_token') required String fcmToken,

    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _UserDeviceDTO;

  factory UserDeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceDTOFromJson(json);
}

extension UserDeviceDTOMapper on UserDeviceDTO {
  UserDeviceModel toDomain() {
    return UserDeviceModel(
      id: id,
      userId: userId,
      fcmToken: fcmToken,
      createdAt: createdAt,
    );
  }
}
