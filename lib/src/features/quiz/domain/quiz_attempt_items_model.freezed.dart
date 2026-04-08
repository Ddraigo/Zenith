// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_attempt_items_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizAttemptItemsModel {

 String get id; String get attemptId; String get flashcardId; bool get isCorrect; DateTime? get createdAt;
/// Create a copy of QuizAttemptItemsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAttemptItemsModelCopyWith<QuizAttemptItemsModel> get copyWith => _$QuizAttemptItemsModelCopyWithImpl<QuizAttemptItemsModel>(this as QuizAttemptItemsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAttemptItemsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptId, attemptId) || other.attemptId == attemptId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,attemptId,flashcardId,isCorrect,createdAt);

@override
String toString() {
  return 'QuizAttemptItemsModel(id: $id, attemptId: $attemptId, flashcardId: $flashcardId, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $QuizAttemptItemsModelCopyWith<$Res>  {
  factory $QuizAttemptItemsModelCopyWith(QuizAttemptItemsModel value, $Res Function(QuizAttemptItemsModel) _then) = _$QuizAttemptItemsModelCopyWithImpl;
@useResult
$Res call({
 String id, String attemptId, String flashcardId, bool isCorrect, DateTime? createdAt
});




}
/// @nodoc
class _$QuizAttemptItemsModelCopyWithImpl<$Res>
    implements $QuizAttemptItemsModelCopyWith<$Res> {
  _$QuizAttemptItemsModelCopyWithImpl(this._self, this._then);

  final QuizAttemptItemsModel _self;
  final $Res Function(QuizAttemptItemsModel) _then;

/// Create a copy of QuizAttemptItemsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? attemptId = null,Object? flashcardId = null,Object? isCorrect = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptId: null == attemptId ? _self.attemptId : attemptId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAttemptItemsModel].
extension QuizAttemptItemsModelPatterns on QuizAttemptItemsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAttemptItemsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAttemptItemsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAttemptItemsModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptItemsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAttemptItemsModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAttemptItemsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String attemptId,  String flashcardId,  bool isCorrect,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAttemptItemsModel() when $default != null:
return $default(_that.id,_that.attemptId,_that.flashcardId,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String attemptId,  String flashcardId,  bool isCorrect,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptItemsModel():
return $default(_that.id,_that.attemptId,_that.flashcardId,_that.isCorrect,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String attemptId,  String flashcardId,  bool isCorrect,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizAttemptItemsModel() when $default != null:
return $default(_that.id,_that.attemptId,_that.flashcardId,_that.isCorrect,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _QuizAttemptItemsModel implements QuizAttemptItemsModel {
  const _QuizAttemptItemsModel({required this.id, required this.attemptId, required this.flashcardId, required this.isCorrect, this.createdAt});
  

@override final  String id;
@override final  String attemptId;
@override final  String flashcardId;
@override final  bool isCorrect;
@override final  DateTime? createdAt;

/// Create a copy of QuizAttemptItemsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAttemptItemsModelCopyWith<_QuizAttemptItemsModel> get copyWith => __$QuizAttemptItemsModelCopyWithImpl<_QuizAttemptItemsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAttemptItemsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.attemptId, attemptId) || other.attemptId == attemptId)&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,attemptId,flashcardId,isCorrect,createdAt);

@override
String toString() {
  return 'QuizAttemptItemsModel(id: $id, attemptId: $attemptId, flashcardId: $flashcardId, isCorrect: $isCorrect, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$QuizAttemptItemsModelCopyWith<$Res> implements $QuizAttemptItemsModelCopyWith<$Res> {
  factory _$QuizAttemptItemsModelCopyWith(_QuizAttemptItemsModel value, $Res Function(_QuizAttemptItemsModel) _then) = __$QuizAttemptItemsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String attemptId, String flashcardId, bool isCorrect, DateTime? createdAt
});




}
/// @nodoc
class __$QuizAttemptItemsModelCopyWithImpl<$Res>
    implements _$QuizAttemptItemsModelCopyWith<$Res> {
  __$QuizAttemptItemsModelCopyWithImpl(this._self, this._then);

  final _QuizAttemptItemsModel _self;
  final $Res Function(_QuizAttemptItemsModel) _then;

/// Create a copy of QuizAttemptItemsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? attemptId = null,Object? flashcardId = null,Object? isCorrect = null,Object? createdAt = freezed,}) {
  return _then(_QuizAttemptItemsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,attemptId: null == attemptId ? _self.attemptId : attemptId // ignore: cast_nullable_to_non_nullable
as String,flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
