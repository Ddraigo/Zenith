// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserStatsDTO {

 String get userId;@JsonKey(name: 'streak_count') int? get streakCount;@JsonKey(name: 'last_learned_date') DateTime? get lastLearnedDate;@JsonKey(name: 'total_points') int? get totaPoints;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of UserStatsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsDTOCopyWith<UserStatsDTO> get copyWith => _$UserStatsDTOCopyWithImpl<UserStatsDTO>(this as UserStatsDTO, _$identity);

  /// Serializes this UserStatsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatsDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.streakCount, streakCount) || other.streakCount == streakCount)&&(identical(other.lastLearnedDate, lastLearnedDate) || other.lastLearnedDate == lastLearnedDate)&&(identical(other.totaPoints, totaPoints) || other.totaPoints == totaPoints)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,streakCount,lastLearnedDate,totaPoints,updatedAt);

@override
String toString() {
  return 'UserStatsDTO(userId: $userId, streakCount: $streakCount, lastLearnedDate: $lastLearnedDate, totaPoints: $totaPoints, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserStatsDTOCopyWith<$Res>  {
  factory $UserStatsDTOCopyWith(UserStatsDTO value, $Res Function(UserStatsDTO) _then) = _$UserStatsDTOCopyWithImpl;
@useResult
$Res call({
 String userId,@JsonKey(name: 'streak_count') int? streakCount,@JsonKey(name: 'last_learned_date') DateTime? lastLearnedDate,@JsonKey(name: 'total_points') int? totaPoints,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$UserStatsDTOCopyWithImpl<$Res>
    implements $UserStatsDTOCopyWith<$Res> {
  _$UserStatsDTOCopyWithImpl(this._self, this._then);

  final UserStatsDTO _self;
  final $Res Function(UserStatsDTO) _then;

/// Create a copy of UserStatsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? streakCount = freezed,Object? lastLearnedDate = freezed,Object? totaPoints = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,streakCount: freezed == streakCount ? _self.streakCount : streakCount // ignore: cast_nullable_to_non_nullable
as int?,lastLearnedDate: freezed == lastLearnedDate ? _self.lastLearnedDate : lastLearnedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,totaPoints: freezed == totaPoints ? _self.totaPoints : totaPoints // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStatsDTO].
extension UserStatsDTOPatterns on UserStatsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatsDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserStatsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId, @JsonKey(name: 'streak_count')  int? streakCount, @JsonKey(name: 'last_learned_date')  DateTime? lastLearnedDate, @JsonKey(name: 'total_points')  int? totaPoints, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatsDTO() when $default != null:
return $default(_that.userId,_that.streakCount,_that.lastLearnedDate,_that.totaPoints,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId, @JsonKey(name: 'streak_count')  int? streakCount, @JsonKey(name: 'last_learned_date')  DateTime? lastLearnedDate, @JsonKey(name: 'total_points')  int? totaPoints, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserStatsDTO():
return $default(_that.userId,_that.streakCount,_that.lastLearnedDate,_that.totaPoints,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId, @JsonKey(name: 'streak_count')  int? streakCount, @JsonKey(name: 'last_learned_date')  DateTime? lastLearnedDate, @JsonKey(name: 'total_points')  int? totaPoints, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserStatsDTO() when $default != null:
return $default(_that.userId,_that.streakCount,_that.lastLearnedDate,_that.totaPoints,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserStatsDTO implements UserStatsDTO {
  const _UserStatsDTO({required this.userId, @JsonKey(name: 'streak_count') this.streakCount, @JsonKey(name: 'last_learned_date') this.lastLearnedDate, @JsonKey(name: 'total_points') this.totaPoints, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _UserStatsDTO.fromJson(Map<String, dynamic> json) => _$UserStatsDTOFromJson(json);

@override final  String userId;
@override@JsonKey(name: 'streak_count') final  int? streakCount;
@override@JsonKey(name: 'last_learned_date') final  DateTime? lastLearnedDate;
@override@JsonKey(name: 'total_points') final  int? totaPoints;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of UserStatsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsDTOCopyWith<_UserStatsDTO> get copyWith => __$UserStatsDTOCopyWithImpl<_UserStatsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserStatsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatsDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.streakCount, streakCount) || other.streakCount == streakCount)&&(identical(other.lastLearnedDate, lastLearnedDate) || other.lastLearnedDate == lastLearnedDate)&&(identical(other.totaPoints, totaPoints) || other.totaPoints == totaPoints)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,streakCount,lastLearnedDate,totaPoints,updatedAt);

@override
String toString() {
  return 'UserStatsDTO(userId: $userId, streakCount: $streakCount, lastLearnedDate: $lastLearnedDate, totaPoints: $totaPoints, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserStatsDTOCopyWith<$Res> implements $UserStatsDTOCopyWith<$Res> {
  factory _$UserStatsDTOCopyWith(_UserStatsDTO value, $Res Function(_UserStatsDTO) _then) = __$UserStatsDTOCopyWithImpl;
@override @useResult
$Res call({
 String userId,@JsonKey(name: 'streak_count') int? streakCount,@JsonKey(name: 'last_learned_date') DateTime? lastLearnedDate,@JsonKey(name: 'total_points') int? totaPoints,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$UserStatsDTOCopyWithImpl<$Res>
    implements _$UserStatsDTOCopyWith<$Res> {
  __$UserStatsDTOCopyWithImpl(this._self, this._then);

  final _UserStatsDTO _self;
  final $Res Function(_UserStatsDTO) _then;

/// Create a copy of UserStatsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? streakCount = freezed,Object? lastLearnedDate = freezed,Object? totaPoints = freezed,Object? updatedAt = freezed,}) {
  return _then(_UserStatsDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,streakCount: freezed == streakCount ? _self.streakCount : streakCount // ignore: cast_nullable_to_non_nullable
as int?,lastLearnedDate: freezed == lastLearnedDate ? _self.lastLearnedDate : lastLearnedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,totaPoints: freezed == totaPoints ? _self.totaPoints : totaPoints // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
