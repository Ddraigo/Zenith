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

 String? get id; String get deckId; int get position; String get word; String? get partOfSpeech; String? get phonetic; String? get imageUrl; String get meaning; String? get example; List<String>? get synonyms; List<String>? get antonyms; String? get audioUrl; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of FlashcardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardModelCopyWith<FlashcardModel> get copyWith => _$FlashcardModelCopyWithImpl<FlashcardModel>(this as FlashcardModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deckId, deckId) || other.deckId == deckId)&&(identical(other.position, position) || other.position == position)&&(identical(other.word, word) || other.word == word)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.example, example) || other.example == example)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.antonyms, antonyms)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,deckId,position,word,partOfSpeech,phonetic,imageUrl,meaning,example,const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(antonyms),audioUrl,createdAt,updatedAt);

@override
String toString() {
  return 'FlashcardModel(id: $id, deckId: $deckId, position: $position, word: $word, partOfSpeech: $partOfSpeech, phonetic: $phonetic, imageUrl: $imageUrl, meaning: $meaning, example: $example, synonyms: $synonyms, antonyms: $antonyms, audioUrl: $audioUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FlashcardModelCopyWith<$Res>  {
  factory $FlashcardModelCopyWith(FlashcardModel value, $Res Function(FlashcardModel) _then) = _$FlashcardModelCopyWithImpl;
@useResult
$Res call({
 String? id, String deckId, int position, String word, String? partOfSpeech, String? phonetic, String? imageUrl, String meaning, String? example, List<String>? synonyms, List<String>? antonyms, String? audioUrl, DateTime? createdAt, DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? deckId = null,Object? position = null,Object? word = null,Object? partOfSpeech = freezed,Object? phonetic = freezed,Object? imageUrl = freezed,Object? meaning = null,Object? example = freezed,Object? synonyms = freezed,Object? antonyms = freezed,Object? audioUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,deckId: null == deckId ? _self.deckId : deckId // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,phonetic: freezed == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,synonyms: freezed == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,antonyms: freezed == antonyms ? _self.antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String deckId,  int position,  String word,  String? partOfSpeech,  String? phonetic,  String? imageUrl,  String meaning,  String? example,  List<String>? synonyms,  List<String>? antonyms,  String? audioUrl,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardModel() when $default != null:
return $default(_that.id,_that.deckId,_that.position,_that.word,_that.partOfSpeech,_that.phonetic,_that.imageUrl,_that.meaning,_that.example,_that.synonyms,_that.antonyms,_that.audioUrl,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String deckId,  int position,  String word,  String? partOfSpeech,  String? phonetic,  String? imageUrl,  String meaning,  String? example,  List<String>? synonyms,  List<String>? antonyms,  String? audioUrl,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FlashcardModel():
return $default(_that.id,_that.deckId,_that.position,_that.word,_that.partOfSpeech,_that.phonetic,_that.imageUrl,_that.meaning,_that.example,_that.synonyms,_that.antonyms,_that.audioUrl,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String deckId,  int position,  String word,  String? partOfSpeech,  String? phonetic,  String? imageUrl,  String meaning,  String? example,  List<String>? synonyms,  List<String>? antonyms,  String? audioUrl,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardModel() when $default != null:
return $default(_that.id,_that.deckId,_that.position,_that.word,_that.partOfSpeech,_that.phonetic,_that.imageUrl,_that.meaning,_that.example,_that.synonyms,_that.antonyms,_that.audioUrl,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _FlashcardModel implements FlashcardModel {
  const _FlashcardModel({this.id, required this.deckId, required this.position, required this.word, this.partOfSpeech, this.phonetic, this.imageUrl, required this.meaning, this.example, final  List<String>? synonyms, final  List<String>? antonyms, this.audioUrl, this.createdAt, this.updatedAt}): _synonyms = synonyms,_antonyms = antonyms;
  

@override final  String? id;
@override final  String deckId;
@override final  int position;
@override final  String word;
@override final  String? partOfSpeech;
@override final  String? phonetic;
@override final  String? imageUrl;
@override final  String meaning;
@override final  String? example;
 final  List<String>? _synonyms;
@override List<String>? get synonyms {
  final value = _synonyms;
  if (value == null) return null;
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _antonyms;
@override List<String>? get antonyms {
  final value = _antonyms;
  if (value == null) return null;
  if (_antonyms is EqualUnmodifiableListView) return _antonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? audioUrl;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of FlashcardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardModelCopyWith<_FlashcardModel> get copyWith => __$FlashcardModelCopyWithImpl<_FlashcardModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deckId, deckId) || other.deckId == deckId)&&(identical(other.position, position) || other.position == position)&&(identical(other.word, word) || other.word == word)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.example, example) || other.example == example)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._antonyms, _antonyms)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,deckId,position,word,partOfSpeech,phonetic,imageUrl,meaning,example,const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_antonyms),audioUrl,createdAt,updatedAt);

@override
String toString() {
  return 'FlashcardModel(id: $id, deckId: $deckId, position: $position, word: $word, partOfSpeech: $partOfSpeech, phonetic: $phonetic, imageUrl: $imageUrl, meaning: $meaning, example: $example, synonyms: $synonyms, antonyms: $antonyms, audioUrl: $audioUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FlashcardModelCopyWith<$Res> implements $FlashcardModelCopyWith<$Res> {
  factory _$FlashcardModelCopyWith(_FlashcardModel value, $Res Function(_FlashcardModel) _then) = __$FlashcardModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String deckId, int position, String word, String? partOfSpeech, String? phonetic, String? imageUrl, String meaning, String? example, List<String>? synonyms, List<String>? antonyms, String? audioUrl, DateTime? createdAt, DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? deckId = null,Object? position = null,Object? word = null,Object? partOfSpeech = freezed,Object? phonetic = freezed,Object? imageUrl = freezed,Object? meaning = null,Object? example = freezed,Object? synonyms = freezed,Object? antonyms = freezed,Object? audioUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FlashcardModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,deckId: null == deckId ? _self.deckId : deckId // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,phonetic: freezed == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,synonyms: freezed == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,antonyms: freezed == antonyms ? _self._antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
