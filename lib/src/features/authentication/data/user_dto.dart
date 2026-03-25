
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

  factory UserDTO.fromAuthResponse(AuthResponse response){
    final user = response.user;
    if( user == null){
      throw const AppException.errorWithMessage('Missing user in AuthResponse');
    }

    if(user.email == null){
      throw const AppException.errorWithMessage('Missing email in Auth user');
    }

    if(DateTime.tryParse(user.createdAt) == null){
      throw const AppException.errorWithMessage('Missing ceatedAt in Auth user');
    }

    return UserDTO(
      id: user.id, 
      email: user.email!, 
      createdAt: DateTime.parse(user.createdAt), 
      );
  }  
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