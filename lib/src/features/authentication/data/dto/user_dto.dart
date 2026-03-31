
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_demo/src/features/authentication/domain/user_model.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO{

  const factory UserDTO({

    required String id,  
    required String email,
    @JsonKey(name: 'created_at')
    required DateTime createdAt,
  }) = _UserDTO ;

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

}

extension UserDTOMapper on UserDTO {
  UserModel toDomain() {
    return UserModel(
      id: id,
      email: email,
      createdAt: createdAt, 
    );
  }

}