// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_attempt_items_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizAttemptItemsDTO {

 String get id;@JsonKey(name: 'attempt_id') String get attemptId;@JsonKey(name: 'question') String get question;@JsonKey(name: 'user_answer') String get userAnswer;@JsonKey(name: 'is_correct') bool get isCorrect;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of QuizAttemptItemsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAttemptItemsDTOCopyWith<QuizAttemptItemsDTO> get copyWith => _$QuizAttemptItemsDTOCopyWithImpl<QuizAttemptItemsDTO>(this as QuizAttemptItemsDTO, _$identity);

  /// Serializes this QuizAttemptItemsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAttemptItemsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptId, attemptId) || other.attemptId == attemptId)&&(identical(other.question, question) || other.question == question)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attemptId,question,userAnswer,isCorrect,createdAt);

@override
String toString() {
  return 'QuizAttemptItemsDTO(id: $id, attemptId: $attemptId, question: $question, userAnswer: $userAnswer, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QuizAttemptItemsDTOCopyWith<$Res>  {
  factory $QuizAttemptItemsDTOCopyWith(QuizAttemptItemsDTO value, $Res Function(QuizAttemptItemsDTO) _then) = _$QuizAttemptItemsDTOCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'attempt_id') String attemptId,@JsonKey(name: 'question') String question,@JsonKey(name: 'user_answer') String userAnswer,@JsonKey(name: 'is_correct') bool isCorrect,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$QuizAttemptItemsDTOCopyWithImpl<$Res>
    implements $QuizAttemptItemsDTOCopyWith<$Res> {
  _$QuizAttemptItemsDTOCopyWithImpl(this._self, this._then);

  final QuizAttemptItemsDTO _self;
  final $Res Function(QuizAttemptItemsDTO) _then;

/// Create a copy of QuizAttemptItemsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attemptId = null,Object? question = null,Object? userAnswer = null,Object? isCorrect = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptId: null == attemptId ? _self.attemptId : attemptId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAttemptItemsDTO].
extension QuizAttemptItemsDTOPatterns on QuizAttemptItemsDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAttemptItemsDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAttemptItemsDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAttemptItemsDTO value)  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptItemsDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAttemptItemsDTO value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptItemsDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'attempt_id')  String attemptId, @JsonKey(name: 'question')  String question, @JsonKey(name: 'user_answer')  String userAnswer, @JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAttemptItemsDTO() when $default != null:
return $default(_that.id,_that.attemptId,_that.question,_that.userAnswer,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'attempt_id')  String attemptId, @JsonKey(name: 'question')  String question, @JsonKey(name: 'user_answer')  String userAnswer, @JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptItemsDTO():
return $default(_that.id,_that.attemptId,_that.question,_that.userAnswer,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'attempt_id')  String attemptId, @JsonKey(name: 'question')  String question, @JsonKey(name: 'user_answer')  String userAnswer, @JsonKey(name: 'is_correct')  bool isCorrect, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptItemsDTO() when $default != null:
return $default(_that.id,_that.attemptId,_that.question,_that.userAnswer,_that.isCorrect,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAttemptItemsDTO implements QuizAttemptItemsDTO {
  const _QuizAttemptItemsDTO({required this.id, @JsonKey(name: 'attempt_id') required this.attemptId, @JsonKey(name: 'question') required this.question, @JsonKey(name: 'user_answer') required this.userAnswer, @JsonKey(name: 'is_correct') required this.isCorrect, @JsonKey(name: 'created_at') required this.createdAt});
  factory _QuizAttemptItemsDTO.fromJson(Map<String, dynamic> json) => _$QuizAttemptItemsDTOFromJson(json);

@override final  String id;
@override@JsonKey(name: 'attempt_id') final  String attemptId;
@override@JsonKey(name: 'question') final  String question;
@override@JsonKey(name: 'user_answer') final  String userAnswer;
@override@JsonKey(name: 'is_correct') final  bool isCorrect;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of QuizAttemptItemsDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAttemptItemsDTOCopyWith<_QuizAttemptItemsDTO> get copyWith => __$QuizAttemptItemsDTOCopyWithImpl<_QuizAttemptItemsDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAttemptItemsDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAttemptItemsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptId, attemptId) || other.attemptId == attemptId)&&(identical(other.question, question) || other.question == question)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,attemptId,question,userAnswer,isCorrect,createdAt);

@override
String toString() {
  return 'QuizAttemptItemsDTO(id: $id, attemptId: $attemptId, question: $question, userAnswer: $userAnswer, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuizAttemptItemsDTOCopyWith<$Res> implements $QuizAttemptItemsDTOCopyWith<$Res> {
  factory _$QuizAttemptItemsDTOCopyWith(_QuizAttemptItemsDTO value, $Res Function(_QuizAttemptItemsDTO) _then) = __$QuizAttemptItemsDTOCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'attempt_id') String attemptId,@JsonKey(name: 'question') String question,@JsonKey(name: 'user_answer') String userAnswer,@JsonKey(name: 'is_correct') bool isCorrect,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$QuizAttemptItemsDTOCopyWithImpl<$Res>
    implements _$QuizAttemptItemsDTOCopyWith<$Res> {
  __$QuizAttemptItemsDTOCopyWithImpl(this._self, this._then);

  final _QuizAttemptItemsDTO _self;
  final $Res Function(_QuizAttemptItemsDTO) _then;

/// Create a copy of QuizAttemptItemsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attemptId = null,Object? question = null,Object? userAnswer = null,Object? isCorrect = null,Object? createdAt = null,}) {
  return _then(_QuizAttemptItemsDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptId: null == attemptId ? _self.attemptId : attemptId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
