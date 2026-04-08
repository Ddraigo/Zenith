// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_flashcard_progress_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserFlashcardProgressDTO {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'flashcard_id') String get flashcardId;@JsonKey(name: 'is_learned') bool get isLearned;@JsonKey(name: 'wrong_count') int get wrongCount;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of UserFlashcardProgressDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserFlashcardProgressDTOCopyWith<UserFlashcardProgressDTO> get copyWith => _$UserFlashcardProgressDTOCopyWithImpl<UserFlashcardProgressDTO>(this as UserFlashcardProgressDTO, _$identity);

  /// Serializes this UserFlashcardProgressDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserFlashcardProgressDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.isLearned, isLearned) || other.isLearned == isLearned)&&(identical(other.wrongCount, wrongCount) || other.wrongCount == wrongCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,isLearned,wrongCount,createdAt,updatedAt);

@override
String toString() {
  return 'UserFlashcardProgressDTO(userId: $userId, flashcardId: $flashcardId, isLearned: $isLearned, wrongCount: $wrongCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserFlashcardProgressDTOCopyWith<$Res>  {
  factory $UserFlashcardProgressDTOCopyWith(UserFlashcardProgressDTO value, $Res Function(UserFlashcardProgressDTO) _then) = _$UserFlashcardProgressDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'flashcard_id') String flashcardId,@JsonKey(name: 'is_learned') bool isLearned,@JsonKey(name: 'wrong_count') int wrongCount,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$UserFlashcardProgressDTOCopyWithImpl<$Res>
    implements $UserFlashcardProgressDTOCopyWith<$Res> {
  _$UserFlashcardProgressDTOCopyWithImpl(this._self, this._then);

  final UserFlashcardProgressDTO _self;
  final $Res Function(UserFlashcardProgressDTO) _then;

/// Create a copy of UserFlashcardProgressDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? flashcardId = null,Object? isLearned = null,Object? wrongCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,isLearned: null == isLearned ? _self.isLearned : isLearned // ignore: cast_nullable_to_non_nullable
as bool,wrongCount: null == wrongCount ? _self.wrongCount : wrongCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserFlashcardProgressDTO].
extension UserFlashcardProgressDTOPatterns on UserFlashcardProgressDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserFlashcardProgressDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserFlashcardProgressDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserFlashcardProgressDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserFlashcardProgressDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserFlashcardProgressDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserFlashcardProgressDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'is_learned')  bool isLearned, @JsonKey(name: 'wrong_count')  int wrongCount, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserFlashcardProgressDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'is_learned')  bool isLearned, @JsonKey(name: 'wrong_count')  int wrongCount, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserFlashcardProgressDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'is_learned')  bool isLearned, @JsonKey(name: 'wrong_count')  int wrongCount, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserFlashcardProgressDTO() when $default != null:
return $default(_that.userId,_that.flashcardId,_that.isLearned,_that.wrongCount,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserFlashcardProgressDTO implements UserFlashcardProgressDTO {
  const _UserFlashcardProgressDTO({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'flashcard_id') required this.flashcardId, @JsonKey(name: 'is_learned') required this.isLearned, @JsonKey(name: 'wrong_count') required this.wrongCount, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _UserFlashcardProgressDTO.fromJson(Map<String, dynamic> json) => _$UserFlashcardProgressDTOFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'flashcard_id') final  String flashcardId;
@override@JsonKey(name: 'is_learned') final  bool isLearned;
@override@JsonKey(name: 'wrong_count') final  int wrongCount;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of UserFlashcardProgressDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserFlashcardProgressDTOCopyWith<_UserFlashcardProgressDTO> get copyWith => __$UserFlashcardProgressDTOCopyWithImpl<_UserFlashcardProgressDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserFlashcardProgressDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserFlashcardProgressDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.isLearned, isLearned) || other.isLearned == isLearned)&&(identical(other.wrongCount, wrongCount) || other.wrongCount == wrongCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,isLearned,wrongCount,createdAt,updatedAt);

@override
String toString() {
  return 'UserFlashcardProgressDTO(userId: $userId, flashcardId: $flashcardId, isLearned: $isLearned, wrongCount: $wrongCount, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserFlashcardProgressDTOCopyWith<$Res> implements $UserFlashcardProgressDTOCopyWith<$Res> {
  factory _$UserFlashcardProgressDTOCopyWith(_UserFlashcardProgressDTO value, $Res Function(_UserFlashcardProgressDTO) _then) = __$UserFlashcardProgressDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'flashcard_id') String flashcardId,@JsonKey(name: 'is_learned') bool isLearned,@JsonKey(name: 'wrong_count') int wrongCount,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$UserFlashcardProgressDTOCopyWithImpl<$Res>
    implements _$UserFlashcardProgressDTOCopyWith<$Res> {
  __$UserFlashcardProgressDTOCopyWithImpl(this._self, this._then);

  final _UserFlashcardProgressDTO _self;
  final $Res Function(_UserFlashcardProgressDTO) _then;

/// Create a copy of UserFlashcardProgressDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? flashcardId = null,Object? isLearned = null,Object? wrongCount = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_UserFlashcardProgressDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,isLearned: null == isLearned ? _self.isLearned : isLearned // ignore: cast_nullable_to_non_nullable
as bool,wrongCount: null == wrongCount ? _self.wrongCount : wrongCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
