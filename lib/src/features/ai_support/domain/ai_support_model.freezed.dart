// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_support_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AISupportModel {

 String get flashcardId; Map<String, dynamic> get responseJson; int get promptVersion; String get modelName; DateTime? get expiresAt;
/// Create a copy of AISupportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AISupportModelCopyWith<AISupportModel> get copyWith => _$AISupportModelCopyWithImpl<AISupportModel>(this as AISupportModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AISupportModel&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&const DeepCollectionEquality().equals(other.responseJson, responseJson)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,flashcardId,const DeepCollectionEquality().hash(responseJson),promptVersion,modelName,expiresAt);

@override
String toString() {
  return 'AISupportModel(flashcardId: $flashcardId, responseJson: $responseJson, promptVersion: $promptVersion, modelName: $modelName, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $AISupportModelCopyWith<$Res>  {
  factory $AISupportModelCopyWith(AISupportModel value, $Res Function(AISupportModel) _then) = _$AISupportModelCopyWithImpl;
@useResult
$Res call({
 String flashcardId, Map<String, dynamic> responseJson, int promptVersion, String modelName, DateTime? expiresAt
});




}
/// @nodoc
class _$AISupportModelCopyWithImpl<$Res>
    implements $AISupportModelCopyWith<$Res> {
  _$AISupportModelCopyWithImpl(this._self, this._then);

  final AISupportModel _self;
  final $Res Function(AISupportModel) _then;

/// Create a copy of AISupportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flashcardId = null,Object? responseJson = null,Object? promptVersion = null,Object? modelName = null,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,responseJson: null == responseJson ? _self.responseJson : responseJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as int,modelName: null == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AISupportModel].
extension AISupportModelPatterns on AISupportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AISupportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AISupportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AISupportModel value)  $default,){
final _that = this;
switch (_that) {
case _AISupportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AISupportModel value)?  $default,){
final _that = this;
switch (_that) {
case _AISupportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String flashcardId,  Map<String, dynamic> responseJson,  int promptVersion,  String modelName,  DateTime? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AISupportModel() when $default != null:
return $default(_that.flashcardId,_that.responseJson,_that.promptVersion,_that.modelName,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String flashcardId,  Map<String, dynamic> responseJson,  int promptVersion,  String modelName,  DateTime? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _AISupportModel():
return $default(_that.flashcardId,_that.responseJson,_that.promptVersion,_that.modelName,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String flashcardId,  Map<String, dynamic> responseJson,  int promptVersion,  String modelName,  DateTime? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _AISupportModel() when $default != null:
return $default(_that.flashcardId,_that.responseJson,_that.promptVersion,_that.modelName,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _AISupportModel implements AISupportModel {
  const _AISupportModel({required this.flashcardId, required final  Map<String, dynamic> responseJson, required this.promptVersion, required this.modelName, this.expiresAt}): _responseJson = responseJson;
  

@override final  String flashcardId;
 final  Map<String, dynamic> _responseJson;
@override Map<String, dynamic> get responseJson {
  if (_responseJson is EqualUnmodifiableMapView) return _responseJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_responseJson);
}

@override final  int promptVersion;
@override final  String modelName;
@override final  DateTime? expiresAt;

/// Create a copy of AISupportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AISupportModelCopyWith<_AISupportModel> get copyWith => __$AISupportModelCopyWithImpl<_AISupportModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AISupportModel&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&const DeepCollectionEquality().equals(other._responseJson, _responseJson)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,flashcardId,const DeepCollectionEquality().hash(_responseJson),promptVersion,modelName,expiresAt);

@override
String toString() {
  return 'AISupportModel(flashcardId: $flashcardId, responseJson: $responseJson, promptVersion: $promptVersion, modelName: $modelName, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$AISupportModelCopyWith<$Res> implements $AISupportModelCopyWith<$Res> {
  factory _$AISupportModelCopyWith(_AISupportModel value, $Res Function(_AISupportModel) _then) = __$AISupportModelCopyWithImpl;
@override @useResult
$Res call({
 String flashcardId, Map<String, dynamic> responseJson, int promptVersion, String modelName, DateTime? expiresAt
});




}
/// @nodoc
class __$AISupportModelCopyWithImpl<$Res>
    implements _$AISupportModelCopyWith<$Res> {
  __$AISupportModelCopyWithImpl(this._self, this._then);

  final _AISupportModel _self;
  final $Res Function(_AISupportModel) _then;

/// Create a copy of AISupportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flashcardId = null,Object? responseJson = null,Object? promptVersion = null,Object? modelName = null,Object? expiresAt = freezed,}) {
  return _then(_AISupportModel(
flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,responseJson: null == responseJson ? _self._responseJson : responseJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as int,modelName: null == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
