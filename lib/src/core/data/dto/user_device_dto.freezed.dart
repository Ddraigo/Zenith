// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDeviceDTO {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'fcm_token') String get fcmToken;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of UserDeviceDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDeviceDTOCopyWith<UserDeviceDTO> get copyWith => _$UserDeviceDTOCopyWithImpl<UserDeviceDTO>(this as UserDeviceDTO, _$identity);

  /// Serializes this UserDeviceDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDeviceDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fcmToken,createdAt);

@override
String toString() {
  return 'UserDeviceDTO(id: $id, userId: $userId, fcmToken: $fcmToken, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserDeviceDTOCopyWith<$Res>  {
  factory $UserDeviceDTOCopyWith(UserDeviceDTO value, $Res Function(UserDeviceDTO) _then) = _$UserDeviceDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'fcm_token') String fcmToken,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$UserDeviceDTOCopyWithImpl<$Res>
    implements $UserDeviceDTOCopyWith<$Res> {
  _$UserDeviceDTOCopyWithImpl(this._self, this._then);

  final UserDeviceDTO _self;
  final $Res Function(UserDeviceDTO) _then;

/// Create a copy of UserDeviceDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? fcmToken = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDeviceDTO].
extension UserDeviceDTOPatterns on UserDeviceDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDeviceDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDeviceDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDeviceDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserDeviceDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDeviceDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserDeviceDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'fcm_token')  String fcmToken, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDeviceDTO() when $default != null:
return $default(_that.id,_that.userId,_that.fcmToken,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'fcm_token')  String fcmToken, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserDeviceDTO():
return $default(_that.id,_that.userId,_that.fcmToken,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'fcm_token')  String fcmToken, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDeviceDTO() when $default != null:
return $default(_that.id,_that.userId,_that.fcmToken,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDeviceDTO implements UserDeviceDTO {
  const _UserDeviceDTO({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'fcm_token') required this.fcmToken, @JsonKey(name: 'created_at') required this.createdAt});
  factory _UserDeviceDTO.fromJson(Map<String, dynamic> json) => _$UserDeviceDTOFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'fcm_token') final  String fcmToken;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of UserDeviceDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDeviceDTOCopyWith<_UserDeviceDTO> get copyWith => __$UserDeviceDTOCopyWithImpl<_UserDeviceDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDeviceDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDeviceDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,fcmToken,createdAt);

@override
String toString() {
  return 'UserDeviceDTO(id: $id, userId: $userId, fcmToken: $fcmToken, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserDeviceDTOCopyWith<$Res> implements $UserDeviceDTOCopyWith<$Res> {
  factory _$UserDeviceDTOCopyWith(_UserDeviceDTO value, $Res Function(_UserDeviceDTO) _then) = __$UserDeviceDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'fcm_token') String fcmToken,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$UserDeviceDTOCopyWithImpl<$Res>
    implements _$UserDeviceDTOCopyWith<$Res> {
  __$UserDeviceDTOCopyWithImpl(this._self, this._then);

  final _UserDeviceDTO _self;
  final $Res Function(_UserDeviceDTO) _then;

/// Create a copy of UserDeviceDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? fcmToken = null,Object? createdAt = null,}) {
  return _then(_UserDeviceDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
