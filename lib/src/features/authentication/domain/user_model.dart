
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';


// User userFromJson(String str) =>
//  User.fromJson(json.decode(str) as Map<String, dynamic>);

// String userToJson(User data) => json.encode(data.toJson());

@freezed
abstract class UserModel with _$UserModel {

  const factory UserModel({
    required String id,
    required String email,
    required DateTime createdAt,
    }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  
}