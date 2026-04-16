// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_attempts_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizAttemptsDTO {

 String get id;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'topic_id') int get topicId;@JsonKey(name: 'attempt_type') String? get attemptType; int get score;@JsonKey(name: 'total_questions') int get totalQuestions;@JsonKey(name: 'correct_answers') int get correctAnswers;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of QuizAttemptsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAttemptsDTOCopyWith<QuizAttemptsDTO> get copyWith => _$QuizAttemptsDTOCopyWithImpl<QuizAttemptsDTO>(this as QuizAttemptsDTO, _$identity);

  /// Serializes this QuizAttemptsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAttemptsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.attemptType, attemptType) || other.attemptType == attemptType)&&(identical(other.score, score) || other.score == score)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,attemptType,score,totalQuestions,correctAnswers,createdAt);

@override
String toString() {
  return 'QuizAttemptsDTO(id: $id, userId: $userId, topicId: $topicId, attemptType: $attemptType, score: $score, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QuizAttemptsDTOCopyWith<$Res>  {
  factory $QuizAttemptsDTOCopyWith(QuizAttemptsDTO value, $Res Function(QuizAttemptsDTO) _then) = _$QuizAttemptsDTOCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') int topicId,@JsonKey(name: 'attempt_type') String? attemptType, int score,@JsonKey(name: 'total_questions') int totalQuestions,@JsonKey(name: 'correct_answers') int correctAnswers,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$QuizAttemptsDTOCopyWithImpl<$Res>
    implements $QuizAttemptsDTOCopyWith<$Res> {
  _$QuizAttemptsDTOCopyWithImpl(this._self, this._then);

  final QuizAttemptsDTO _self;
  final $Res Function(QuizAttemptsDTO) _then;

/// Create a copy of QuizAttemptsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? topicId = null,Object? attemptType = freezed,Object? score = null,Object? totalQuestions = null,Object? correctAnswers = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,attemptType: freezed == attemptType ? _self.attemptType : attemptType // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAttemptsDTO].
extension QuizAttemptsDTOPatterns on QuizAttemptsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAttemptsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAttemptsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAttemptsDTO value)  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAttemptsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  int topicId, @JsonKey(name: 'attempt_type')  String? attemptType,  int score, @JsonKey(name: 'total_questions')  int totalQuestions, @JsonKey(name: 'correct_answers')  int correctAnswers, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAttemptsDTO() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.attemptType,_that.score,_that.totalQuestions,_that.correctAnswers,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  int topicId, @JsonKey(name: 'attempt_type')  String? attemptType,  int score, @JsonKey(name: 'total_questions')  int totalQuestions, @JsonKey(name: 'correct_answers')  int correctAnswers, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptsDTO():
return $default(_that.id,_that.userId,_that.topicId,_that.attemptType,_that.score,_that.totalQuestions,_that.correctAnswers,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  int topicId, @JsonKey(name: 'attempt_type')  String? attemptType,  int score, @JsonKey(name: 'total_questions')  int totalQuestions, @JsonKey(name: 'correct_answers')  int correctAnswers, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptsDTO() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.attemptType,_that.score,_that.totalQuestions,_that.correctAnswers,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAttemptsDTO implements QuizAttemptsDTO {
  const _QuizAttemptsDTO({required this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'topic_id') required this.topicId, @JsonKey(name: 'attempt_type') this.attemptType, required this.score, @JsonKey(name: 'total_questions') required this.totalQuestions, @JsonKey(name: 'correct_answers') required this.correctAnswers, @JsonKey(name: 'created_at') required this.createdAt});
  factory _QuizAttemptsDTO.fromJson(Map<String, dynamic> json) => _$QuizAttemptsDTOFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'topic_id') final  int topicId;
@override@JsonKey(name: 'attempt_type') final  String? attemptType;
@override final  int score;
@override@JsonKey(name: 'total_questions') final  int totalQuestions;
@override@JsonKey(name: 'correct_answers') final  int correctAnswers;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of QuizAttemptsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAttemptsDTOCopyWith<_QuizAttemptsDTO> get copyWith => __$QuizAttemptsDTOCopyWithImpl<_QuizAttemptsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAttemptsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAttemptsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.attemptType, attemptType) || other.attemptType == attemptType)&&(identical(other.score, score) || other.score == score)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,attemptType,score,totalQuestions,correctAnswers,createdAt);

@override
String toString() {
  return 'QuizAttemptsDTO(id: $id, userId: $userId, topicId: $topicId, attemptType: $attemptType, score: $score, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuizAttemptsDTOCopyWith<$Res> implements $QuizAttemptsDTOCopyWith<$Res> {
  factory _$QuizAttemptsDTOCopyWith(_QuizAttemptsDTO value, $Res Function(_QuizAttemptsDTO) _then) = __$QuizAttemptsDTOCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') int topicId,@JsonKey(name: 'attempt_type') String? attemptType, int score,@JsonKey(name: 'total_questions') int totalQuestions,@JsonKey(name: 'correct_answers') int correctAnswers,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$QuizAttemptsDTOCopyWithImpl<$Res>
    implements _$QuizAttemptsDTOCopyWith<$Res> {
  __$QuizAttemptsDTOCopyWithImpl(this._self, this._then);

  final _QuizAttemptsDTO _self;
  final $Res Function(_QuizAttemptsDTO) _then;

/// Create a copy of QuizAttemptsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? topicId = null,Object? attemptType = freezed,Object? score = null,Object? totalQuestions = null,Object? correctAnswers = null,Object? createdAt = null,}) {
  return _then(_QuizAttemptsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,attemptType: freezed == attemptType ? _self.attemptType : attemptType // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
