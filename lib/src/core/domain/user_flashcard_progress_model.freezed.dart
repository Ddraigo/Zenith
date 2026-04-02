// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_flashcard_progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserFlashcardProgressModel {

 String get userId; String get flashcardId; bool? get isLearned; int? get wrongCount; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of UserFlashcardProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFlashcardProgressModelCopyWith<UserFlashcardProgressModel> get copyWith => _$UserFlashcardProgressModelCopyWithImpl<UserFlashcardProgressModel>(this as UserFlashcardProgressModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFlashcardProgressModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.isLearned, isLearned) || other.isLearned == isLearned)&&(identical(other.wrongCount, wrongCount) || other.wrongCount == wrongCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,isLearned,wrongCount,createdAt,updatedAt);

@override
String toString() {
  return 'UserFlashcardProgressModel(userId: $userId, flashcardId: $flashcardId, isLearned: $isLearned, wrongCount: $wrongCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserFlashcardProgressModelCopyWith<$Res>  {
  factory $UserFlashcardProgressModelCopyWith(UserFlashcardProgressModel value, $Res Function(UserFlashcardProgressModel) _then) = _$UserFlashcardProgressModelCopyWithImpl;
@useResult
$Res call({
 String userId, String flashcardId, bool? isLearned, int? wrongCount, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$UserFlashcardProgressModelCopyWithImpl<$Res>
    implements $UserFlashcardProgressModelCopyWith<$Res> {
  _$UserFlashcardProgressModelCopyWithImpl(this._self, this._then);

  final UserFlashcardProgressModel _self;
  final $Res Function(UserFlashcardProgressModel) _then;

/// Create a copy of UserFlashcardProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? flashcardId = null,Object? isLearned = freezed,Object? wrongCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,isLearned: freezed == isLearned ? _self.isLearned : isLearned // ignore: cast_nullable_to_non_nullable
as bool?,wrongCount: freezed == wrongCount ? _self.wrongCount : wrongCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserFlashcardProgressModel].
extension UserFlashcardProgressModelPatterns on UserFlashcardProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFlashcardProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFlashcardProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFlashcardProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _UserFlashcardProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFlashcardProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserFlashcardProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String flashcardId,  bool? isLearned,  int? wrongCount,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFlashcardProgressModel() when $default != null:
return $default(_that.userId,_that.flashcardId,_that.isLearned,_that.wrongCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String flashcardId,  bool? isLearned,  int? wrongCount,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserFlashcardProgressModel():
return $default(_that.userId,_that.flashcardId,_that.isLearned,_that.wrongCount,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String flashcardId,  bool? isLearned,  int? wrongCount,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserFlashcardProgressModel() when $default != null:
return $default(_that.userId,_that.flashcardId,_that.isLearned,_that.wrongCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserFlashcardProgressModel implements UserFlashcardProgressModel {
  const _UserFlashcardProgressModel({required this.userId, required this.flashcardId, this.isLearned = false, this.wrongCount = -1, this.createdAt, this.updatedAt});
  

@override final  String userId;
@override final  String flashcardId;
@override@JsonKey() final  bool? isLearned;
@override@JsonKey() final  int? wrongCount;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of UserFlashcardProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFlashcardProgressModelCopyWith<_UserFlashcardProgressModel> get copyWith => __$UserFlashcardProgressModelCopyWithImpl<_UserFlashcardProgressModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFlashcardProgressModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.isLearned, isLearned) || other.isLearned == isLearned)&&(identical(other.wrongCount, wrongCount) || other.wrongCount == wrongCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,isLearned,wrongCount,createdAt,updatedAt);

@override
String toString() {
  return 'UserFlashcardProgressModel(userId: $userId, flashcardId: $flashcardId, isLearned: $isLearned, wrongCount: $wrongCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserFlashcardProgressModelCopyWith<$Res> implements $UserFlashcardProgressModelCopyWith<$Res> {
  factory _$UserFlashcardProgressModelCopyWith(_UserFlashcardProgressModel value, $Res Function(_UserFlashcardProgressModel) _then) = __$UserFlashcardProgressModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String flashcardId, bool? isLearned, int? wrongCount, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$UserFlashcardProgressModelCopyWithImpl<$Res>
    implements _$UserFlashcardProgressModelCopyWith<$Res> {
  __$UserFlashcardProgressModelCopyWithImpl(this._self, this._then);

  final _UserFlashcardProgressModel _self;
  final $Res Function(_UserFlashcardProgressModel) _then;

/// Create a copy of UserFlashcardProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? flashcardId = null,Object? isLearned = freezed,Object? wrongCount = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_UserFlashcardProgressModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,isLearned: freezed == isLearned ? _self.isLearned : isLearned // ignore: cast_nullable_to_non_nullable
as bool?,wrongCount: freezed == wrongCount ? _self.wrongCount : wrongCount // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
