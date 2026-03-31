// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlashcardModel {

 String? get id; int get topicId; String get word; String? get partOfSpeech; String get meaning; String? get example; DateTime? get createdAt;
/// Create a copy of FlashcardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardModelCopyWith<FlashcardModel> get copyWith => _$FlashcardModelCopyWithImpl<FlashcardModel>(this as FlashcardModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.word, word) || other.word == word)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,topicId,word,partOfSpeech,meaning,example,createdAt);

@override
String toString() {
  return 'FlashcardModel(id: $id, topicId: $topicId, word: $word, partOfSpeech: $partOfSpeech, meaning: $meaning, example: $example, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FlashcardModelCopyWith<$Res>  {
  factory $FlashcardModelCopyWith(FlashcardModel value, $Res Function(FlashcardModel) _then) = _$FlashcardModelCopyWithImpl;
@useResult
$Res call({
 String? id, int topicId, String word, String? partOfSpeech, String meaning, String? example, DateTime? createdAt
});




}
/// @nodoc
class _$FlashcardModelCopyWithImpl<$Res>
    implements $FlashcardModelCopyWith<$Res> {
  _$FlashcardModelCopyWithImpl(this._self, this._then);

  final FlashcardModel _self;
  final $Res Function(FlashcardModel) _then;

/// Create a copy of FlashcardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? topicId = null,Object? word = null,Object? partOfSpeech = freezed,Object? meaning = null,Object? example = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardModel].
extension FlashcardModelPatterns on FlashcardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardModel value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  int topicId,  String word,  String? partOfSpeech,  String meaning,  String? example,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardModel() when $default != null:
return $default(_that.id,_that.topicId,_that.word,_that.partOfSpeech,_that.meaning,_that.example,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  int topicId,  String word,  String? partOfSpeech,  String meaning,  String? example,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _FlashcardModel():
return $default(_that.id,_that.topicId,_that.word,_that.partOfSpeech,_that.meaning,_that.example,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  int topicId,  String word,  String? partOfSpeech,  String meaning,  String? example,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardModel() when $default != null:
return $default(_that.id,_that.topicId,_that.word,_that.partOfSpeech,_that.meaning,_that.example,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _FlashcardModel implements FlashcardModel {
  const _FlashcardModel({this.id = '', required this.topicId, required this.word, this.partOfSpeech = '', required this.meaning, this.example = '', this.createdAt});
  

@override@JsonKey() final  String? id;
@override final  int topicId;
@override final  String word;
@override@JsonKey() final  String? partOfSpeech;
@override final  String meaning;
@override@JsonKey() final  String? example;
@override final  DateTime? createdAt;

/// Create a copy of FlashcardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardModelCopyWith<_FlashcardModel> get copyWith => __$FlashcardModelCopyWithImpl<_FlashcardModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.word, word) || other.word == word)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,topicId,word,partOfSpeech,meaning,example,createdAt);

@override
String toString() {
  return 'FlashcardModel(id: $id, topicId: $topicId, word: $word, partOfSpeech: $partOfSpeech, meaning: $meaning, example: $example, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FlashcardModelCopyWith<$Res> implements $FlashcardModelCopyWith<$Res> {
  factory _$FlashcardModelCopyWith(_FlashcardModel value, $Res Function(_FlashcardModel) _then) = __$FlashcardModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, int topicId, String word, String? partOfSpeech, String meaning, String? example, DateTime? createdAt
});




}
/// @nodoc
class __$FlashcardModelCopyWithImpl<$Res>
    implements _$FlashcardModelCopyWith<$Res> {
  __$FlashcardModelCopyWithImpl(this._self, this._then);

  final _FlashcardModel _self;
  final $Res Function(_FlashcardModel) _then;

/// Create a copy of FlashcardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? topicId = null,Object? word = null,Object? partOfSpeech = freezed,Object? meaning = null,Object? example = freezed,Object? createdAt = freezed,}) {
  return _then(_FlashcardModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
