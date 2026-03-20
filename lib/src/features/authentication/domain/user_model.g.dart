// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  userName: json['userName'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'userName': instance.userName,
  'email': instance.email,
  'password': instance.password,
};
