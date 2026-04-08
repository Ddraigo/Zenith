// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_attempts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizAttemptsModel {

 String get id; String get userId; int? get topicId; int? get score; int get totalQuestions; int? get correctAnswers; DateTime? get createdAt;
/// Create a copy of QuizAttemptsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAttemptsModelCopyWith<QuizAttemptsModel> get copyWith => _$QuizAttemptsModelCopyWithImpl<QuizAttemptsModel>(this as QuizAttemptsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAttemptsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.score, score) || other.score == score)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,score,totalQuestions,correctAnswers,createdAt);

@override
String toString() {
  return 'QuizAttemptsModel(id: $id, userId: $userId, topicId: $topicId, score: $score, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QuizAttemptsModelCopyWith<$Res>  {
  factory $QuizAttemptsModelCopyWith(QuizAttemptsModel value, $Res Function(QuizAttemptsModel) _then) = _$QuizAttemptsModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, int? topicId, int? score, int totalQuestions, int? correctAnswers, DateTime? createdAt
});




}
/// @nodoc
class _$QuizAttemptsModelCopyWithImpl<$Res>
    implements $QuizAttemptsModelCopyWith<$Res> {
  _$QuizAttemptsModelCopyWithImpl(this._self, this._then);

  final QuizAttemptsModel _self;
  final $Res Function(QuizAttemptsModel) _then;

/// Create a copy of QuizAttemptsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? topicId = freezed,Object? score = freezed,Object? totalQuestions = null,Object? correctAnswers = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: freezed == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAttemptsModel].
extension QuizAttemptsModelPatterns on QuizAttemptsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAttemptsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAttemptsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAttemptsModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAttemptsModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  int? topicId,  int? score,  int totalQuestions,  int? correctAnswers,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAttemptsModel() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.score,_that.totalQuestions,_that.correctAnswers,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  int? topicId,  int? score,  int totalQuestions,  int? correctAnswers,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptsModel():
return $default(_that.id,_that.userId,_that.topicId,_that.score,_that.totalQuestions,_that.correctAnswers,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  int? topicId,  int? score,  int totalQuestions,  int? correctAnswers,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptsModel() when $default != null:
return $default(_that.id,_that.userId,_that.topicId,_that.score,_that.totalQuestions,_that.correctAnswers,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _QuizAttemptsModel implements QuizAttemptsModel {
  const _QuizAttemptsModel({required this.id, required this.userId, this.topicId = 0, this.score = 0, required this.totalQuestions, this.correctAnswers = 0, this.createdAt});
  

@override final  String id;
@override final  String userId;
@override@JsonKey() final  int? topicId;
@override@JsonKey() final  int? score;
@override final  int totalQuestions;
@override@JsonKey() final  int? correctAnswers;
@override final  DateTime? createdAt;

/// Create a copy of QuizAttemptsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAttemptsModelCopyWith<_QuizAttemptsModel> get copyWith => __$QuizAttemptsModelCopyWithImpl<_QuizAttemptsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAttemptsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.score, score) || other.score == score)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,topicId,score,totalQuestions,correctAnswers,createdAt);

@override
String toString() {
  return 'QuizAttemptsModel(id: $id, userId: $userId, topicId: $topicId, score: $score, totalQuestions: $totalQuestions, correctAnswers: $correctAnswers, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuizAttemptsModelCopyWith<$Res> implements $QuizAttemptsModelCopyWith<$Res> {
  factory _$QuizAttemptsModelCopyWith(_QuizAttemptsModel value, $Res Function(_QuizAttemptsModel) _then) = __$QuizAttemptsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, int? topicId, int? score, int totalQuestions, int? correctAnswers, DateTime? createdAt
});




}
/// @nodoc
class __$QuizAttemptsModelCopyWithImpl<$Res>
    implements _$QuizAttemptsModelCopyWith<$Res> {
  __$QuizAttemptsModelCopyWithImpl(this._self, this._then);

  final _QuizAttemptsModel _self;
  final $Res Function(_QuizAttemptsModel) _then;

/// Create a copy of QuizAttemptsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? topicId = freezed,Object? score = freezed,Object? totalQuestions = null,Object? correctAnswers = freezed,Object? createdAt = freezed,}) {
  return _then(_QuizAttemptsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,correctAnswers: freezed == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
