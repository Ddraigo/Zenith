// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDeviceDTO _$UserDeviceDTOFromJson(Map<String, dynamic> json) =>
    _UserDeviceDTO(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      fcmToken: json['fcm_token'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserDeviceDTOToJson(_UserDeviceDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'fcm_token': instance.fcmToken,
      'created_at': instance.createdAt.toIso8601String(),
    };
