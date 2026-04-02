// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlashcardDTO {

 String get id;@JsonKey(name: 'topic_id') int get topicId; String get word;@JsonKey(name: 'part_of_speech') String? get partOfSpeech; String get meaning; String? get example;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of FlashcardDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardDTOCopyWith<FlashcardDTO> get copyWith => _$FlashcardDTOCopyWithImpl<FlashcardDTO>(this as FlashcardDTO, _$identity);

  /// Serializes this FlashcardDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.word, word) || other.word == word)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topicId,word,partOfSpeech,meaning,example,createdAt);

@override
String toString() {
  return 'FlashcardDTO(id: $id, topicId: $topicId, word: $word, partOfSpeech: $partOfSpeech, meaning: $meaning, example: $example, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FlashcardDTOCopyWith<$Res>  {
  factory $FlashcardDTOCopyWith(FlashcardDTO value, $Res Function(FlashcardDTO) _then) = _$FlashcardDTOCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'topic_id') int topicId, String word,@JsonKey(name: 'part_of_speech') String? partOfSpeech, String meaning, String? example,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$FlashcardDTOCopyWithImpl<$Res>
    implements $FlashcardDTOCopyWith<$Res> {
  _$FlashcardDTOCopyWithImpl(this._self, this._then);

  final FlashcardDTO _self;
  final $Res Function(FlashcardDTO) _then;

/// Create a copy of FlashcardDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topicId = null,Object? word = null,Object? partOfSpeech = freezed,Object? meaning = null,Object? example = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardDTO].
extension FlashcardDTOPatterns on FlashcardDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardDTO value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardDTO value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'topic_id')  int topicId,  String word, @JsonKey(name: 'part_of_speech')  String? partOfSpeech,  String meaning,  String? example, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardDTO() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'topic_id')  int topicId,  String word, @JsonKey(name: 'part_of_speech')  String? partOfSpeech,  String meaning,  String? example, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _FlashcardDTO():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'topic_id')  int topicId,  String word, @JsonKey(name: 'part_of_speech')  String? partOfSpeech,  String meaning,  String? example, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardDTO() when $default != null:
return $default(_that.id,_that.topicId,_that.word,_that.partOfSpeech,_that.meaning,_that.example,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlashcardDTO implements FlashcardDTO {
  const _FlashcardDTO({required this.id, @JsonKey(name: 'topic_id') required this.topicId, required this.word, @JsonKey(name: 'part_of_speech') this.partOfSpeech, required this.meaning, this.example, @JsonKey(name: 'created_at') required this.createdAt});
  factory _FlashcardDTO.fromJson(Map<String, dynamic> json) => _$FlashcardDTOFromJson(json);

@override final  String id;
@override@JsonKey(name: 'topic_id') final  int topicId;
@override final  String word;
@override@JsonKey(name: 'part_of_speech') final  String? partOfSpeech;
@override final  String meaning;
@override final  String? example;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of FlashcardDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardDTOCopyWith<_FlashcardDTO> get copyWith => __$FlashcardDTOCopyWithImpl<_FlashcardDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashcardDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.word, word) || other.word == word)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.meaning, meaning) || other.meaning == meaning)&&(identical(other.example, example) || other.example == example)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,topicId,word,partOfSpeech,meaning,example,createdAt);

@override
String toString() {
  return 'FlashcardDTO(id: $id, topicId: $topicId, word: $word, partOfSpeech: $partOfSpeech, meaning: $meaning, example: $example, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FlashcardDTOCopyWith<$Res> implements $FlashcardDTOCopyWith<$Res> {
  factory _$FlashcardDTOCopyWith(_FlashcardDTO value, $Res Function(_FlashcardDTO) _then) = __$FlashcardDTOCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'topic_id') int topicId, String word,@JsonKey(name: 'part_of_speech') String? partOfSpeech, String meaning, String? example,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$FlashcardDTOCopyWithImpl<$Res>
    implements _$FlashcardDTOCopyWith<$Res> {
  __$FlashcardDTOCopyWithImpl(this._self, this._then);

  final _FlashcardDTO _self;
  final $Res Function(_FlashcardDTO) _then;

/// Create a copy of FlashcardDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topicId = null,Object? word = null,Object? partOfSpeech = freezed,Object? meaning = null,Object? example = freezed,Object? createdAt = null,}) {
  return _then(_FlashcardDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: freezed == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String?,meaning: null == meaning ? _self.meaning : meaning // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
