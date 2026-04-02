// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_daily_word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserDailyWordModel {

 String get userId; String get flashcardId; int? get topicId; DateTime get assignedDate; bool? get isCompleted; DateTime? get createdAt;
/// Create a copy of UserDailyWordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDailyWordModelCopyWith<UserDailyWordModel> get copyWith => _$UserDailyWordModelCopyWithImpl<UserDailyWordModel>(this as UserDailyWordModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDailyWordModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,topicId,assignedDate,isCompleted,createdAt);

@override
String toString() {
  return 'UserDailyWordModel(userId: $userId, flashcardId: $flashcardId, topicId: $topicId, assignedDate: $assignedDate, isCompleted: $isCompleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserDailyWordModelCopyWith<$Res>  {
  factory $UserDailyWordModelCopyWith(UserDailyWordModel value, $Res Function(UserDailyWordModel) _then) = _$UserDailyWordModelCopyWithImpl;
@useResult
$Res call({
 String userId, String flashcardId, int? topicId, DateTime assignedDate, bool? isCompleted, DateTime? createdAt
});




}
/// @nodoc
class _$UserDailyWordModelCopyWithImpl<$Res>
    implements $UserDailyWordModelCopyWith<$Res> {
  _$UserDailyWordModelCopyWithImpl(this._self, this._then);

  final UserDailyWordModel _self;
  final $Res Function(UserDailyWordModel) _then;

/// Create a copy of UserDailyWordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? flashcardId = null,Object? topicId = freezed,Object? assignedDate = null,Object? isCompleted = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int?,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: freezed == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDailyWordModel].
extension UserDailyWordModelPatterns on UserDailyWordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDailyWordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDailyWordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDailyWordModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDailyWordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDailyWordModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDailyWordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String flashcardId,  int? topicId,  DateTime assignedDate,  bool? isCompleted,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDailyWordModel() when $default != null:
return $default(_that.userId,_that.flashcardId,_that.topicId,_that.assignedDate,_that.isCompleted,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String flashcardId,  int? topicId,  DateTime assignedDate,  bool? isCompleted,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserDailyWordModel():
return $default(_that.userId,_that.flashcardId,_that.topicId,_that.assignedDate,_that.isCompleted,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String flashcardId,  int? topicId,  DateTime assignedDate,  bool? isCompleted,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDailyWordModel() when $default != null:
return $default(_that.userId,_that.flashcardId,_that.topicId,_that.assignedDate,_that.isCompleted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserDailyWordModel implements UserDailyWordModel {
  const _UserDailyWordModel({required this.userId, required this.flashcardId, this.topicId = 0, required this.assignedDate, this.isCompleted = false, this.createdAt});
  

@override final  String userId;
@override final  String flashcardId;
@override@JsonKey() final  int? topicId;
@override final  DateTime assignedDate;
@override@JsonKey() final  bool? isCompleted;
@override final  DateTime? createdAt;

/// Create a copy of UserDailyWordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDailyWordModelCopyWith<_UserDailyWordModel> get copyWith => __$UserDailyWordModelCopyWithImpl<_UserDailyWordModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDailyWordModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,topicId,assignedDate,isCompleted,createdAt);

@override
String toString() {
  return 'UserDailyWordModel(userId: $userId, flashcardId: $flashcardId, topicId: $topicId, assignedDate: $assignedDate, isCompleted: $isCompleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserDailyWordModelCopyWith<$Res> implements $UserDailyWordModelCopyWith<$Res> {
  factory _$UserDailyWordModelCopyWith(_UserDailyWordModel value, $Res Function(_UserDailyWordModel) _then) = __$UserDailyWordModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String flashcardId, int? topicId, DateTime assignedDate, bool? isCompleted, DateTime? createdAt
});




}
/// @nodoc
class __$UserDailyWordModelCopyWithImpl<$Res>
    implements _$UserDailyWordModelCopyWith<$Res> {
  __$UserDailyWordModelCopyWithImpl(this._self, this._then);

  final _UserDailyWordModel _self;
  final $Res Function(_UserDailyWordModel) _then;

/// Create a copy of UserDailyWordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? flashcardId = null,Object? topicId = freezed,Object? assignedDate = null,Object? isCompleted = freezed,Object? createdAt = freezed,}) {
  return _then(_UserDailyWordModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int?,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: freezed == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
