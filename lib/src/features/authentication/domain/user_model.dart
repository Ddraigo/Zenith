
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';


User userFromJson(String str) =>
 User.fromJson(json.decode(str) as Map<String, dynamic>);

String userToJson(User data) => json.encode(data.toJson());

@freezed
abstract class User with _$User {

  const factory User({
    required String userName, 
    required String email, 
    required String password}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
}