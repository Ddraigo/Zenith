// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuestionModel {

 int get topicId; List<QuestionItem> get questions; Map<String, String> get userAnswers;
/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<QuestionModel> get copyWith => _$QuestionModelCopyWithImpl<QuestionModel>(this as QuestionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionModel&&(identical(other.topicId, topicId) || other.topicId == topicId)&&const DeepCollectionEquality().equals(other.questions, questions)&&const DeepCollectionEquality().equals(other.userAnswers, userAnswers));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,const DeepCollectionEquality().hash(questions),const DeepCollectionEquality().hash(userAnswers));

@override
String toString() {
  return 'QuestionModel(topicId: $topicId, questions: $questions, userAnswers: $userAnswers)';
}


}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res>  {
  factory $QuestionModelCopyWith(QuestionModel value, $Res Function(QuestionModel) _then) = _$QuestionModelCopyWithImpl;
@useResult
$Res call({
 int topicId, List<QuestionItem> questions, Map<String, String> userAnswers
});




}
/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topicId = null,Object? questions = null,Object? userAnswers = null,}) {
  return _then(_self.copyWith(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionItem>,userAnswers: null == userAnswers ? _self.userAnswers : userAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionModel].
extension QuestionModelPatterns on QuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _QuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int topicId,  List<QuestionItem> questions,  Map<String, String> userAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.topicId,_that.questions,_that.userAnswers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int topicId,  List<QuestionItem> questions,  Map<String, String> userAnswers)  $default,) {final _that = this;
switch (_that) {
case _QuestionModel():
return $default(_that.topicId,_that.questions,_that.userAnswers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int topicId,  List<QuestionItem> questions,  Map<String, String> userAnswers)?  $default,) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.topicId,_that.questions,_that.userAnswers);case _:
  return null;

}
}

}

/// @nodoc


class _QuestionModel implements QuestionModel {
  const _QuestionModel({required this.topicId, required final  List<QuestionItem> questions, required final  Map<String, String> userAnswers}): _questions = questions,_userAnswers = userAnswers;
  

@override final  int topicId;
 final  List<QuestionItem> _questions;
@override List<QuestionItem> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  Map<String, String> _userAnswers;
@override Map<String, String> get userAnswers {
  if (_userAnswers is EqualUnmodifiableMapView) return _userAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_userAnswers);
}


/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionModelCopyWith<_QuestionModel> get copyWith => __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionModel&&(identical(other.topicId, topicId) || other.topicId == topicId)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._userAnswers, _userAnswers));
}


@override
int get hashCode => Object.hash(runtimeType,topicId,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_userAnswers));

@override
String toString() {
  return 'QuestionModel(topicId: $topicId, questions: $questions, userAnswers: $userAnswers)';
}


}

/// @nodoc
abstract mixin class _$QuestionModelCopyWith<$Res> implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(_QuestionModel value, $Res Function(_QuestionModel) _then) = __$QuestionModelCopyWithImpl;
@override @useResult
$Res call({
 int topicId, List<QuestionItem> questions, Map<String, String> userAnswers
});




}
/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(this._self, this._then);

  final _QuestionModel _self;
  final $Res Function(_QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topicId = null,Object? questions = null,Object? userAnswers = null,}) {
  return _then(_QuestionModel(
topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionItem>,userAnswers: null == userAnswers ? _self._userAnswers : userAnswers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc
mixin _$QuestionItem {

 String get flashcardId; String get question; String get correctAnswer;
/// Create a copy of QuestionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionItemCopyWith<QuestionItem> get copyWith => _$QuestionItemCopyWithImpl<QuestionItem>(this as QuestionItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionItem&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.question, question) || other.question == question)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}


@override
int get hashCode => Object.hash(runtimeType,flashcardId,question,correctAnswer);

@override
String toString() {
  return 'QuestionItem(flashcardId: $flashcardId, question: $question, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class $QuestionItemCopyWith<$Res>  {
  factory $QuestionItemCopyWith(QuestionItem value, $Res Function(QuestionItem) _then) = _$QuestionItemCopyWithImpl;
@useResult
$Res call({
 String flashcardId, String question, String correctAnswer
});




}
/// @nodoc
class _$QuestionItemCopyWithImpl<$Res>
    implements $QuestionItemCopyWith<$Res> {
  _$QuestionItemCopyWithImpl(this._self, this._then);

  final QuestionItem _self;
  final $Res Function(QuestionItem) _then;

/// Create a copy of QuestionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flashcardId = null,Object? question = null,Object? correctAnswer = null,}) {
  return _then(_self.copyWith(
flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionItem].
extension QuestionItemPatterns on QuestionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionItem value)  $default,){
final _that = this;
switch (_that) {
case _QuestionItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionItem value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String flashcardId,  String question,  String correctAnswer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionItem() when $default != null:
return $default(_that.flashcardId,_that.question,_that.correctAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String flashcardId,  String question,  String correctAnswer)  $default,) {final _that = this;
switch (_that) {
case _QuestionItem():
return $default(_that.flashcardId,_that.question,_that.correctAnswer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String flashcardId,  String question,  String correctAnswer)?  $default,) {final _that = this;
switch (_that) {
case _QuestionItem() when $default != null:
return $default(_that.flashcardId,_that.question,_that.correctAnswer);case _:
  return null;

}
}

}

/// @nodoc


class _QuestionItem implements QuestionItem {
  const _QuestionItem({required this.flashcardId, required this.question, required this.correctAnswer});
  

@override final  String flashcardId;
@override final  String question;
@override final  String correctAnswer;

/// Create a copy of QuestionItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionItemCopyWith<_QuestionItem> get copyWith => __$QuestionItemCopyWithImpl<_QuestionItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionItem&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&(identical(other.question, question) || other.question == question)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer));
}


@override
int get hashCode => Object.hash(runtimeType,flashcardId,question,correctAnswer);

@override
String toString() {
  return 'QuestionItem(flashcardId: $flashcardId, question: $question, correctAnswer: $correctAnswer)';
}


}

/// @nodoc
abstract mixin class _$QuestionItemCopyWith<$Res> implements $QuestionItemCopyWith<$Res> {
  factory _$QuestionItemCopyWith(_QuestionItem value, $Res Function(_QuestionItem) _then) = __$QuestionItemCopyWithImpl;
@override @useResult
$Res call({
 String flashcardId, String question, String correctAnswer
});




}
/// @nodoc
class __$QuestionItemCopyWithImpl<$Res>
    implements _$QuestionItemCopyWith<$Res> {
  __$QuestionItemCopyWithImpl(this._self, this._then);

  final _QuestionItem _self;
  final $Res Function(_QuestionItem) _then;

/// Create a copy of QuestionItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flashcardId = null,Object? question = null,Object? correctAnswer = null,}) {
  return _then(_QuestionItem(
flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
