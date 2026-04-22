// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDTO {

@JsonKey(name: 'id') String get userId;@JsonKey(name: 'user_name') String get userName;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'gender') String get gender;@JsonKey(name: 'birthday') DateTime get dayOfBirth;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDTOCopyWith<ProfileDTO> get copyWith => _$ProfileDTOCopyWithImpl<ProfileDTO>(this as ProfileDTO, _$identity);

  /// Serializes this ProfileDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dayOfBirth, dayOfBirth) || other.dayOfBirth == dayOfBirth)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,userName,avatarUrl,gender,dayOfBirth,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileDTO(userId: $userId, userName: $userName, avatarUrl: $avatarUrl, gender: $gender, dayOfBirth: $dayOfBirth, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProfileDTOCopyWith<$Res>  {
  factory $ProfileDTOCopyWith(ProfileDTO value, $Res Function(ProfileDTO) _then) = _$ProfileDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String userId,@JsonKey(name: 'user_name') String userName,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'gender') String gender,@JsonKey(name: 'birthday') DateTime dayOfBirth,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$ProfileDTOCopyWithImpl<$Res>
    implements $ProfileDTOCopyWith<$Res> {
  _$ProfileDTOCopyWithImpl(this._self, this._then);

  final ProfileDTO _self;
  final $Res Function(ProfileDTO) _then;

/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? userName = null,Object? avatarUrl = freezed,Object? gender = null,Object? dayOfBirth = null,Object? createdAt = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dayOfBirth: null == dayOfBirth ? _self.dayOfBirth : dayOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDTO].
extension ProfileDTOPatterns on ProfileDTO {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDTO value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDTO():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDTO value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String userId, @JsonKey(name: 'user_name')  String userName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'gender')  String gender, @JsonKey(name: 'birthday')  DateTime dayOfBirth, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
return $default(_that.userId,_that.userName,_that.avatarUrl,_that.gender,_that.dayOfBirth,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String userId, @JsonKey(name: 'user_name')  String userName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'gender')  String gender, @JsonKey(name: 'birthday')  DateTime dayOfBirth, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProfileDTO():
return $default(_that.userId,_that.userName,_that.avatarUrl,_that.gender,_that.dayOfBirth,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String userId, @JsonKey(name: 'user_name')  String userName, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'gender')  String gender, @JsonKey(name: 'birthday')  DateTime dayOfBirth, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDTO() when $default != null:
return $default(_that.userId,_that.userName,_that.avatarUrl,_that.gender,_that.dayOfBirth,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDTO implements ProfileDTO {
  const _ProfileDTO({@JsonKey(name: 'id') required this.userId, @JsonKey(name: 'user_name') required this.userName, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'gender') required this.gender, @JsonKey(name: 'birthday') required this.dayOfBirth, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _ProfileDTO.fromJson(Map<String, dynamic> json) => _$ProfileDTOFromJson(json);

@override@JsonKey(name: 'id') final  String userId;
@override@JsonKey(name: 'user_name') final  String userName;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'gender') final  String gender;
@override@JsonKey(name: 'birthday') final  DateTime dayOfBirth;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDTOCopyWith<_ProfileDTO> get copyWith => __$ProfileDTOCopyWithImpl<_ProfileDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dayOfBirth, dayOfBirth) || other.dayOfBirth == dayOfBirth)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,userName,avatarUrl,gender,dayOfBirth,createdAt,updatedAt);

@override
String toString() {
  return 'ProfileDTO(userId: $userId, userName: $userName, avatarUrl: $avatarUrl, gender: $gender, dayOfBirth: $dayOfBirth, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProfileDTOCopyWith<$Res> implements $ProfileDTOCopyWith<$Res> {
  factory _$ProfileDTOCopyWith(_ProfileDTO value, $Res Function(_ProfileDTO) _then) = __$ProfileDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String userId,@JsonKey(name: 'user_name') String userName,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'gender') String gender,@JsonKey(name: 'birthday') DateTime dayOfBirth,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$ProfileDTOCopyWithImpl<$Res>
    implements _$ProfileDTOCopyWith<$Res> {
  __$ProfileDTOCopyWithImpl(this._self, this._then);

  final _ProfileDTO _self;
  final $Res Function(_ProfileDTO) _then;

/// Create a copy of ProfileDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? avatarUrl = freezed,Object? gender = null,Object? dayOfBirth = null,Object? createdAt = freezed,Object? updatedAt = null,}) {
  return _then(_ProfileDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,dayOfBirth: null == dayOfBirth ? _self.dayOfBirth : dayOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
