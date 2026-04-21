// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_support_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AISupportResultModel {

 bool get cached; String get source; FlashcardAiSupportModel get data; String? get phonetic; String? get audioUs;
/// Create a copy of AISupportResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AISupportResultModelCopyWith<AISupportResultModel> get copyWith => _$AISupportResultModelCopyWithImpl<AISupportResultModel>(this as AISupportResultModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AISupportResultModel&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.source, source) || other.source == source)&&(identical(other.data, data) || other.data == data)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&(identical(other.audioUs, audioUs) || other.audioUs == audioUs));
}


@override
int get hashCode => Object.hash(runtimeType,cached,source,data,phonetic,audioUs);

@override
String toString() {
  return 'AISupportResultModel(cached: $cached, source: $source, data: $data, phonetic: $phonetic, audioUs: $audioUs)';
}


}

/// @nodoc
abstract mixin class $AISupportResultModelCopyWith<$Res>  {
  factory $AISupportResultModelCopyWith(AISupportResultModel value, $Res Function(AISupportResultModel) _then) = _$AISupportResultModelCopyWithImpl;
@useResult
$Res call({
 bool cached, String source, FlashcardAiSupportModel data, String? phonetic, String? audioUs
});


$FlashcardAiSupportModelCopyWith<$Res> get data;

}
/// @nodoc
class _$AISupportResultModelCopyWithImpl<$Res>
    implements $AISupportResultModelCopyWith<$Res> {
  _$AISupportResultModelCopyWithImpl(this._self, this._then);

  final AISupportResultModel _self;
  final $Res Function(AISupportResultModel) _then;

/// Create a copy of AISupportResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cached = null,Object? source = null,Object? data = null,Object? phonetic = freezed,Object? audioUs = freezed,}) {
  return _then(_self.copyWith(
cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FlashcardAiSupportModel,phonetic: freezed == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String?,audioUs: freezed == audioUs ? _self.audioUs : audioUs // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AISupportResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashcardAiSupportModelCopyWith<$Res> get data {
  
  return $FlashcardAiSupportModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AISupportResultModel].
extension AISupportResultModelPatterns on AISupportResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AISupportResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AISupportResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AISupportResultModel value)  $default,){
final _that = this;
switch (_that) {
case _AISupportResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AISupportResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _AISupportResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool cached,  String source,  FlashcardAiSupportModel data,  String? phonetic,  String? audioUs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AISupportResultModel() when $default != null:
return $default(_that.cached,_that.source,_that.data,_that.phonetic,_that.audioUs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool cached,  String source,  FlashcardAiSupportModel data,  String? phonetic,  String? audioUs)  $default,) {final _that = this;
switch (_that) {
case _AISupportResultModel():
return $default(_that.cached,_that.source,_that.data,_that.phonetic,_that.audioUs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool cached,  String source,  FlashcardAiSupportModel data,  String? phonetic,  String? audioUs)?  $default,) {final _that = this;
switch (_that) {
case _AISupportResultModel() when $default != null:
return $default(_that.cached,_that.source,_that.data,_that.phonetic,_that.audioUs);case _:
  return null;

}
}

}

/// @nodoc


class _AISupportResultModel implements AISupportResultModel {
  const _AISupportResultModel({required this.cached, required this.source, required this.data, this.phonetic = '', this.audioUs = ''});
  

@override final  bool cached;
@override final  String source;
@override final  FlashcardAiSupportModel data;
@override@JsonKey() final  String? phonetic;
@override@JsonKey() final  String? audioUs;

/// Create a copy of AISupportResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AISupportResultModelCopyWith<_AISupportResultModel> get copyWith => __$AISupportResultModelCopyWithImpl<_AISupportResultModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AISupportResultModel&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.source, source) || other.source == source)&&(identical(other.data, data) || other.data == data)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&(identical(other.audioUs, audioUs) || other.audioUs == audioUs));
}


@override
int get hashCode => Object.hash(runtimeType,cached,source,data,phonetic,audioUs);

@override
String toString() {
  return 'AISupportResultModel(cached: $cached, source: $source, data: $data, phonetic: $phonetic, audioUs: $audioUs)';
}


}

/// @nodoc
abstract mixin class _$AISupportResultModelCopyWith<$Res> implements $AISupportResultModelCopyWith<$Res> {
  factory _$AISupportResultModelCopyWith(_AISupportResultModel value, $Res Function(_AISupportResultModel) _then) = __$AISupportResultModelCopyWithImpl;
@override @useResult
$Res call({
 bool cached, String source, FlashcardAiSupportModel data, String? phonetic, String? audioUs
});


@override $FlashcardAiSupportModelCopyWith<$Res> get data;

}
/// @nodoc
class __$AISupportResultModelCopyWithImpl<$Res>
    implements _$AISupportResultModelCopyWith<$Res> {
  __$AISupportResultModelCopyWithImpl(this._self, this._then);

  final _AISupportResultModel _self;
  final $Res Function(_AISupportResultModel) _then;

/// Create a copy of AISupportResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cached = null,Object? source = null,Object? data = null,Object? phonetic = freezed,Object? audioUs = freezed,}) {
  return _then(_AISupportResultModel(
cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FlashcardAiSupportModel,phonetic: freezed == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String?,audioUs: freezed == audioUs ? _self.audioUs : audioUs // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AISupportResultModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FlashcardAiSupportModelCopyWith<$Res> get data {
  
  return $FlashcardAiSupportModelCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
