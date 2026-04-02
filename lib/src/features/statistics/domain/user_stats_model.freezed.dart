// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserStatsModel {

 String get userId; int? get streakCount; DateTime? get lastLearnedDate; int? get totaPoints; DateTime? get updatedAt;
/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatsModelCopyWith<UserStatsModel> get copyWith => _$UserStatsModelCopyWithImpl<UserStatsModel>(this as UserStatsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatsModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.streakCount, streakCount) || other.streakCount == streakCount)&&(identical(other.lastLearnedDate, lastLearnedDate) || other.lastLearnedDate == lastLearnedDate)&&(identical(other.totaPoints, totaPoints) || other.totaPoints == totaPoints)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,streakCount,lastLearnedDate,totaPoints,updatedAt);

@override
String toString() {
  return 'UserStatsModel(userId: $userId, streakCount: $streakCount, lastLearnedDate: $lastLearnedDate, totaPoints: $totaPoints, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserStatsModelCopyWith<$Res>  {
  factory $UserStatsModelCopyWith(UserStatsModel value, $Res Function(UserStatsModel) _then) = _$UserStatsModelCopyWithImpl;
@useResult
$Res call({
 String userId, int? streakCount, DateTime? lastLearnedDate, int? totaPoints, DateTime? updatedAt
});




}
/// @nodoc
class _$UserStatsModelCopyWithImpl<$Res>
    implements $UserStatsModelCopyWith<$Res> {
  _$UserStatsModelCopyWithImpl(this._self, this._then);

  final UserStatsModel _self;
  final $Res Function(UserStatsModel) _then;

/// Create a copy of UserStatsModel
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


/// Adds pattern-matching-related methods to [UserStatsModel].
extension UserStatsModelPatterns on UserStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _UserStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int? streakCount,  DateTime? lastLearnedDate,  int? totaPoints,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int? streakCount,  DateTime? lastLearnedDate,  int? totaPoints,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserStatsModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int? streakCount,  DateTime? lastLearnedDate,  int? totaPoints,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserStatsModel() when $default != null:
return $default(_that.userId,_that.streakCount,_that.lastLearnedDate,_that.totaPoints,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserStatsModel implements UserStatsModel {
  const _UserStatsModel({required this.userId, this.streakCount = 0, this.lastLearnedDate, this.totaPoints = 0, this.updatedAt});
  

@override final  String userId;
@override@JsonKey() final  int? streakCount;
@override final  DateTime? lastLearnedDate;
@override@JsonKey() final  int? totaPoints;
@override final  DateTime? updatedAt;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatsModelCopyWith<_UserStatsModel> get copyWith => __$UserStatsModelCopyWithImpl<_UserStatsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatsModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.streakCount, streakCount) || other.streakCount == streakCount)&&(identical(other.lastLearnedDate, lastLearnedDate) || other.lastLearnedDate == lastLearnedDate)&&(identical(other.totaPoints, totaPoints) || other.totaPoints == totaPoints)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,streakCount,lastLearnedDate,totaPoints,updatedAt);

@override
String toString() {
  return 'UserStatsModel(userId: $userId, streakCount: $streakCount, lastLearnedDate: $lastLearnedDate, totaPoints: $totaPoints, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserStatsModelCopyWith<$Res> implements $UserStatsModelCopyWith<$Res> {
  factory _$UserStatsModelCopyWith(_UserStatsModel value, $Res Function(_UserStatsModel) _then) = __$UserStatsModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, int? streakCount, DateTime? lastLearnedDate, int? totaPoints, DateTime? updatedAt
});




}
/// @nodoc
class __$UserStatsModelCopyWithImpl<$Res>
    implements _$UserStatsModelCopyWith<$Res> {
  __$UserStatsModelCopyWithImpl(this._self, this._then);

  final _UserStatsModel _self;
  final $Res Function(_UserStatsModel) _then;

/// Create a copy of UserStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? streakCount = freezed,Object? lastLearnedDate = freezed,Object? totaPoints = freezed,Object? updatedAt = freezed,}) {
  return _then(_UserStatsModel(
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
