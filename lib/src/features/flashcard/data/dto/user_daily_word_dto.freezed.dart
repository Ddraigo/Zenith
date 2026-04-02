// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_daily_word_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDailyWordDTO {

 String get userId;@JsonKey(name: 'flashcard_id') String get flashcardId;@JsonKey(name: 'topic_id') int? get topicId;@JsonKey(name: 'assigned_date') DateTime get assignedDate;@JsonKey(name: 'is_completed') bool? get isCompleted;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of UserDailyWordDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDailyWordDTOCopyWith<UserDailyWordDTO> get copyWith => _$UserDailyWordDTOCopyWithImpl<UserDailyWordDTO>(this as UserDailyWordDTO, _$identity);

  /// Serializes this UserDailyWordDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDailyWordDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,topicId,assignedDate,isCompleted,createdAt);

@override
String toString() {
  return 'UserDailyWordDTO(userId: $userId, flashcardId: $flashcardId, topicId: $topicId, assignedDate: $assignedDate, isCompleted: $isCompleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserDailyWordDTOCopyWith<$Res>  {
  factory $UserDailyWordDTOCopyWith(UserDailyWordDTO value, $Res Function(UserDailyWordDTO) _then) = _$UserDailyWordDTOCopyWithImpl;
@useResult
$Res call({
 String userId,@JsonKey(name: 'flashcard_id') String flashcardId,@JsonKey(name: 'topic_id') int? topicId,@JsonKey(name: 'assigned_date') DateTime assignedDate,@JsonKey(name: 'is_completed') bool? isCompleted,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$UserDailyWordDTOCopyWithImpl<$Res>
    implements $UserDailyWordDTOCopyWith<$Res> {
  _$UserDailyWordDTOCopyWithImpl(this._self, this._then);

  final UserDailyWordDTO _self;
  final $Res Function(UserDailyWordDTO) _then;

/// Create a copy of UserDailyWordDTO
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


/// Adds pattern-matching-related methods to [UserDailyWordDTO].
extension UserDailyWordDTOPatterns on UserDailyWordDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDailyWordDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDailyWordDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDailyWordDTO value)  $default,){
final _that = this;
switch (_that) {
case _UserDailyWordDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDailyWordDTO value)?  $default,){
final _that = this;
switch (_that) {
case _UserDailyWordDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId, @JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'topic_id')  int? topicId, @JsonKey(name: 'assigned_date')  DateTime assignedDate, @JsonKey(name: 'is_completed')  bool? isCompleted, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDailyWordDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId, @JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'topic_id')  int? topicId, @JsonKey(name: 'assigned_date')  DateTime assignedDate, @JsonKey(name: 'is_completed')  bool? isCompleted, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserDailyWordDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId, @JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'topic_id')  int? topicId, @JsonKey(name: 'assigned_date')  DateTime assignedDate, @JsonKey(name: 'is_completed')  bool? isCompleted, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDailyWordDTO() when $default != null:
return $default(_that.userId,_that.flashcardId,_that.topicId,_that.assignedDate,_that.isCompleted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDailyWordDTO implements UserDailyWordDTO {
  const _UserDailyWordDTO({required this.userId, @JsonKey(name: 'flashcard_id') required this.flashcardId, @JsonKey(name: 'topic_id') this.topicId, @JsonKey(name: 'assigned_date') required this.assignedDate, @JsonKey(name: 'is_completed') this.isCompleted, @JsonKey(name: 'created_at') this.createdAt});
  factory _UserDailyWordDTO.fromJson(Map<String, dynamic> json) => _$UserDailyWordDTOFromJson(json);

@override final  String userId;
@override@JsonKey(name: 'flashcard_id') final  String flashcardId;
@override@JsonKey(name: 'topic_id') final  int? topicId;
@override@JsonKey(name: 'assigned_date') final  DateTime assignedDate;
@override@JsonKey(name: 'is_completed') final  bool? isCompleted;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of UserDailyWordDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDailyWordDTOCopyWith<_UserDailyWordDTO> get copyWith => __$UserDailyWordDTOCopyWithImpl<_UserDailyWordDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDailyWordDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDailyWordDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,flashcardId,topicId,assignedDate,isCompleted,createdAt);

@override
String toString() {
  return 'UserDailyWordDTO(userId: $userId, flashcardId: $flashcardId, topicId: $topicId, assignedDate: $assignedDate, isCompleted: $isCompleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserDailyWordDTOCopyWith<$Res> implements $UserDailyWordDTOCopyWith<$Res> {
  factory _$UserDailyWordDTOCopyWith(_UserDailyWordDTO value, $Res Function(_UserDailyWordDTO) _then) = __$UserDailyWordDTOCopyWithImpl;
@override @useResult
$Res call({
 String userId,@JsonKey(name: 'flashcard_id') String flashcardId,@JsonKey(name: 'topic_id') int? topicId,@JsonKey(name: 'assigned_date') DateTime assignedDate,@JsonKey(name: 'is_completed') bool? isCompleted,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$UserDailyWordDTOCopyWithImpl<$Res>
    implements _$UserDailyWordDTOCopyWith<$Res> {
  __$UserDailyWordDTOCopyWithImpl(this._self, this._then);

  final _UserDailyWordDTO _self;
  final $Res Function(_UserDailyWordDTO) _then;

/// Create a copy of UserDailyWordDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? flashcardId = null,Object? topicId = freezed,Object? assignedDate = null,Object? isCompleted = freezed,Object? createdAt = freezed,}) {
  return _then(_UserDailyWordDTO(
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
