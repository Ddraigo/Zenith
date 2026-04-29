// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_ai_support_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FlashcardAiSupportModel {

 String get easyMeaning; List<String> get whenToUse; List<ExampleItemModel> get examples; List<String> get commonPhrases; List<String> get synonyms; List<String> get antonyms; String get memoryTip;
/// Create a copy of FlashcardAiSupportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashcardAiSupportModelCopyWith<FlashcardAiSupportModel> get copyWith => _$FlashcardAiSupportModelCopyWithImpl<FlashcardAiSupportModel>(this as FlashcardAiSupportModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashcardAiSupportModel&&(identical(other.easyMeaning, easyMeaning) || other.easyMeaning == easyMeaning)&&const DeepCollectionEquality().equals(other.whenToUse, whenToUse)&&const DeepCollectionEquality().equals(other.examples, examples)&&const DeepCollectionEquality().equals(other.commonPhrases, commonPhrases)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.antonyms, antonyms)&&(identical(other.memoryTip, memoryTip) || other.memoryTip == memoryTip));
}


@override
int get hashCode => Object.hash(runtimeType,easyMeaning,const DeepCollectionEquality().hash(whenToUse),const DeepCollectionEquality().hash(examples),const DeepCollectionEquality().hash(commonPhrases),const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(antonyms),memoryTip);

@override
String toString() {
  return 'FlashcardAiSupportModel(easyMeaning: $easyMeaning, whenToUse: $whenToUse, examples: $examples, commonPhrases: $commonPhrases, synonyms: $synonyms, antonyms: $antonyms, memoryTip: $memoryTip)';
}


}

/// @nodoc
abstract mixin class $FlashcardAiSupportModelCopyWith<$Res>  {
  factory $FlashcardAiSupportModelCopyWith(FlashcardAiSupportModel value, $Res Function(FlashcardAiSupportModel) _then) = _$FlashcardAiSupportModelCopyWithImpl;
@useResult
$Res call({
 String easyMeaning, List<String> whenToUse, List<ExampleItemModel> examples, List<String> commonPhrases, List<String> synonyms, List<String> antonyms, String memoryTip
});




}
/// @nodoc
class _$FlashcardAiSupportModelCopyWithImpl<$Res>
    implements $FlashcardAiSupportModelCopyWith<$Res> {
  _$FlashcardAiSupportModelCopyWithImpl(this._self, this._then);

  final FlashcardAiSupportModel _self;
  final $Res Function(FlashcardAiSupportModel) _then;

/// Create a copy of FlashcardAiSupportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? easyMeaning = null,Object? whenToUse = null,Object? examples = null,Object? commonPhrases = null,Object? synonyms = null,Object? antonyms = null,Object? memoryTip = null,}) {
  return _then(_self.copyWith(
easyMeaning: null == easyMeaning ? _self.easyMeaning : easyMeaning // ignore: cast_nullable_to_non_nullable
as String,whenToUse: null == whenToUse ? _self.whenToUse : whenToUse // ignore: cast_nullable_to_non_nullable
as List<String>,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<ExampleItemModel>,commonPhrases: null == commonPhrases ? _self.commonPhrases : commonPhrases // ignore: cast_nullable_to_non_nullable
as List<String>,synonyms: null == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self.antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,memoryTip: null == memoryTip ? _self.memoryTip : memoryTip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FlashcardAiSupportModel].
extension FlashcardAiSupportModelPatterns on FlashcardAiSupportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlashcardAiSupportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlashcardAiSupportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlashcardAiSupportModel value)  $default,){
final _that = this;
switch (_that) {
case _FlashcardAiSupportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlashcardAiSupportModel value)?  $default,){
final _that = this;
switch (_that) {
case _FlashcardAiSupportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String easyMeaning,  List<String> whenToUse,  List<ExampleItemModel> examples,  List<String> commonPhrases,  List<String> synonyms,  List<String> antonyms,  String memoryTip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlashcardAiSupportModel() when $default != null:
return $default(_that.easyMeaning,_that.whenToUse,_that.examples,_that.commonPhrases,_that.synonyms,_that.antonyms,_that.memoryTip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String easyMeaning,  List<String> whenToUse,  List<ExampleItemModel> examples,  List<String> commonPhrases,  List<String> synonyms,  List<String> antonyms,  String memoryTip)  $default,) {final _that = this;
switch (_that) {
case _FlashcardAiSupportModel():
return $default(_that.easyMeaning,_that.whenToUse,_that.examples,_that.commonPhrases,_that.synonyms,_that.antonyms,_that.memoryTip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String easyMeaning,  List<String> whenToUse,  List<ExampleItemModel> examples,  List<String> commonPhrases,  List<String> synonyms,  List<String> antonyms,  String memoryTip)?  $default,) {final _that = this;
switch (_that) {
case _FlashcardAiSupportModel() when $default != null:
return $default(_that.easyMeaning,_that.whenToUse,_that.examples,_that.commonPhrases,_that.synonyms,_that.antonyms,_that.memoryTip);case _:
  return null;

}
}

}

/// @nodoc


class _FlashcardAiSupportModel implements FlashcardAiSupportModel {
  const _FlashcardAiSupportModel({required this.easyMeaning, required final  List<String> whenToUse, required final  List<ExampleItemModel> examples, required final  List<String> commonPhrases, required final  List<String> synonyms, final  List<String> antonyms = const [], this.memoryTip = ''}): _whenToUse = whenToUse,_examples = examples,_commonPhrases = commonPhrases,_synonyms = synonyms,_antonyms = antonyms;
  

@override final  String easyMeaning;
 final  List<String> _whenToUse;
@override List<String> get whenToUse {
  if (_whenToUse is EqualUnmodifiableListView) return _whenToUse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_whenToUse);
}

 final  List<ExampleItemModel> _examples;
@override List<ExampleItemModel> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}

 final  List<String> _commonPhrases;
@override List<String> get commonPhrases {
  if (_commonPhrases is EqualUnmodifiableListView) return _commonPhrases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commonPhrases);
}

 final  List<String> _synonyms;
@override List<String> get synonyms {
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_synonyms);
}

 final  List<String> _antonyms;
@override@JsonKey() List<String> get antonyms {
  if (_antonyms is EqualUnmodifiableListView) return _antonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_antonyms);
}

@override@JsonKey() final  String memoryTip;

/// Create a copy of FlashcardAiSupportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlashcardAiSupportModelCopyWith<_FlashcardAiSupportModel> get copyWith => __$FlashcardAiSupportModelCopyWithImpl<_FlashcardAiSupportModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlashcardAiSupportModel&&(identical(other.easyMeaning, easyMeaning) || other.easyMeaning == easyMeaning)&&const DeepCollectionEquality().equals(other._whenToUse, _whenToUse)&&const DeepCollectionEquality().equals(other._examples, _examples)&&const DeepCollectionEquality().equals(other._commonPhrases, _commonPhrases)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._antonyms, _antonyms)&&(identical(other.memoryTip, memoryTip) || other.memoryTip == memoryTip));
}


@override
int get hashCode => Object.hash(runtimeType,easyMeaning,const DeepCollectionEquality().hash(_whenToUse),const DeepCollectionEquality().hash(_examples),const DeepCollectionEquality().hash(_commonPhrases),const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_antonyms),memoryTip);

@override
String toString() {
  return 'FlashcardAiSupportModel(easyMeaning: $easyMeaning, whenToUse: $whenToUse, examples: $examples, commonPhrases: $commonPhrases, synonyms: $synonyms, antonyms: $antonyms, memoryTip: $memoryTip)';
}


}

/// @nodoc
abstract mixin class _$FlashcardAiSupportModelCopyWith<$Res> implements $FlashcardAiSupportModelCopyWith<$Res> {
  factory _$FlashcardAiSupportModelCopyWith(_FlashcardAiSupportModel value, $Res Function(_FlashcardAiSupportModel) _then) = __$FlashcardAiSupportModelCopyWithImpl;
@override @useResult
$Res call({
 String easyMeaning, List<String> whenToUse, List<ExampleItemModel> examples, List<String> commonPhrases, List<String> synonyms, List<String> antonyms, String memoryTip
});




}
/// @nodoc
class __$FlashcardAiSupportModelCopyWithImpl<$Res>
    implements _$FlashcardAiSupportModelCopyWith<$Res> {
  __$FlashcardAiSupportModelCopyWithImpl(this._self, this._then);

  final _FlashcardAiSupportModel _self;
  final $Res Function(_FlashcardAiSupportModel) _then;

/// Create a copy of FlashcardAiSupportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? easyMeaning = null,Object? whenToUse = null,Object? examples = null,Object? commonPhrases = null,Object? synonyms = null,Object? antonyms = null,Object? memoryTip = null,}) {
  return _then(_FlashcardAiSupportModel(
easyMeaning: null == easyMeaning ? _self.easyMeaning : easyMeaning // ignore: cast_nullable_to_non_nullable
as String,whenToUse: null == whenToUse ? _self._whenToUse : whenToUse // ignore: cast_nullable_to_non_nullable
as List<String>,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<ExampleItemModel>,commonPhrases: null == commonPhrases ? _self._commonPhrases : commonPhrases // ignore: cast_nullable_to_non_nullable
as List<String>,synonyms: null == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self._antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,memoryTip: null == memoryTip ? _self.memoryTip : memoryTip // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExampleItemModel {

 String get en; String get vi;
/// Create a copy of ExampleItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleItemModelCopyWith<ExampleItemModel> get copyWith => _$ExampleItemModelCopyWithImpl<ExampleItemModel>(this as ExampleItemModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleItemModel&&(identical(other.en, en) || other.en == en)&&(identical(other.vi, vi) || other.vi == vi));
}


@override
int get hashCode => Object.hash(runtimeType,en,vi);

@override
String toString() {
  return 'ExampleItemModel(en: $en, vi: $vi)';
}


}

/// @nodoc
abstract mixin class $ExampleItemModelCopyWith<$Res>  {
  factory $ExampleItemModelCopyWith(ExampleItemModel value, $Res Function(ExampleItemModel) _then) = _$ExampleItemModelCopyWithImpl;
@useResult
$Res call({
 String en, String vi
});




}
/// @nodoc
class _$ExampleItemModelCopyWithImpl<$Res>
    implements $ExampleItemModelCopyWith<$Res> {
  _$ExampleItemModelCopyWithImpl(this._self, this._then);

  final ExampleItemModel _self;
  final $Res Function(ExampleItemModel) _then;

/// Create a copy of ExampleItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = null,Object? vi = null,}) {
  return _then(_self.copyWith(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,vi: null == vi ? _self.vi : vi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExampleItemModel].
extension ExampleItemModelPatterns on ExampleItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExampleItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExampleItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExampleItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ExampleItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExampleItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExampleItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String en,  String vi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExampleItemModel() when $default != null:
return $default(_that.en,_that.vi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String en,  String vi)  $default,) {final _that = this;
switch (_that) {
case _ExampleItemModel():
return $default(_that.en,_that.vi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String en,  String vi)?  $default,) {final _that = this;
switch (_that) {
case _ExampleItemModel() when $default != null:
return $default(_that.en,_that.vi);case _:
  return null;

}
}

}

/// @nodoc


class _ExampleItemModel implements ExampleItemModel {
  const _ExampleItemModel({this.en = '', this.vi = ''});
  

@override@JsonKey() final  String en;
@override@JsonKey() final  String vi;

/// Create a copy of ExampleItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleItemModelCopyWith<_ExampleItemModel> get copyWith => __$ExampleItemModelCopyWithImpl<_ExampleItemModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleItemModel&&(identical(other.en, en) || other.en == en)&&(identical(other.vi, vi) || other.vi == vi));
}


@override
int get hashCode => Object.hash(runtimeType,en,vi);

@override
String toString() {
  return 'ExampleItemModel(en: $en, vi: $vi)';
}


}

/// @nodoc
abstract mixin class _$ExampleItemModelCopyWith<$Res> implements $ExampleItemModelCopyWith<$Res> {
  factory _$ExampleItemModelCopyWith(_ExampleItemModel value, $Res Function(_ExampleItemModel) _then) = __$ExampleItemModelCopyWithImpl;
@override @useResult
$Res call({
 String en, String vi
});




}
/// @nodoc
class __$ExampleItemModelCopyWithImpl<$Res>
    implements _$ExampleItemModelCopyWith<$Res> {
  __$ExampleItemModelCopyWithImpl(this._self, this._then);

  final _ExampleItemModel _self;
  final $Res Function(_ExampleItemModel) _then;

/// Create a copy of ExampleItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = null,Object? vi = null,}) {
  return _then(_ExampleItemModel(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,vi: null == vi ? _self.vi : vi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
