import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_device_model.freezed.dart';

@freezed
abstract class UserDeviceModel with _$UserDeviceModel {
  const factory UserDeviceModel({
    required String id,
    required String userId,

    @Default('') String fcmToken,
    required DateTime createdAt,
  }) = _UserDeviceModel;

  
}
