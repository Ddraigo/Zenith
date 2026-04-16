// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_support_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AISupportDTO {

@JsonKey(name: 'flashcard_id') String get flashcardId;@JsonKey(name: 'response_json') Map<String, dynamic> get responseJson;@JsonKey(name: 'prompt_version') int get promptVersion;@JsonKey(name: 'model_name') String get modelName;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of AISupportDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AISupportDTOCopyWith<AISupportDTO> get copyWith => _$AISupportDTOCopyWithImpl<AISupportDTO>(this as AISupportDTO, _$identity);

  /// Serializes this AISupportDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AISupportDTO&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&const DeepCollectionEquality().equals(other.responseJson, responseJson)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flashcardId,const DeepCollectionEquality().hash(responseJson),promptVersion,modelName,expiresAt,createdAt,updatedAt);

@override
String toString() {
  return 'AISupportDTO(flashcardId: $flashcardId, responseJson: $responseJson, promptVersion: $promptVersion, modelName: $modelName, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AISupportDTOCopyWith<$Res>  {
  factory $AISupportDTOCopyWith(AISupportDTO value, $Res Function(AISupportDTO) _then) = _$AISupportDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'flashcard_id') String flashcardId,@JsonKey(name: 'response_json') Map<String, dynamic> responseJson,@JsonKey(name: 'prompt_version') int promptVersion,@JsonKey(name: 'model_name') String modelName,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$AISupportDTOCopyWithImpl<$Res>
    implements $AISupportDTOCopyWith<$Res> {
  _$AISupportDTOCopyWithImpl(this._self, this._then);

  final AISupportDTO _self;
  final $Res Function(AISupportDTO) _then;

/// Create a copy of AISupportDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? flashcardId = null,Object? responseJson = null,Object? promptVersion = null,Object? modelName = null,Object? expiresAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,responseJson: null == responseJson ? _self.responseJson : responseJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as int,modelName: null == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AISupportDTO].
extension AISupportDTOPatterns on AISupportDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AISupportDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AISupportDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AISupportDTO value)  $default,){
final _that = this;
switch (_that) {
case _AISupportDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AISupportDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AISupportDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'response_json')  Map<String, dynamic> responseJson, @JsonKey(name: 'prompt_version')  int promptVersion, @JsonKey(name: 'model_name')  String modelName, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AISupportDTO() when $default != null:
return $default(_that.flashcardId,_that.responseJson,_that.promptVersion,_that.modelName,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'response_json')  Map<String, dynamic> responseJson, @JsonKey(name: 'prompt_version')  int promptVersion, @JsonKey(name: 'model_name')  String modelName, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AISupportDTO():
return $default(_that.flashcardId,_that.responseJson,_that.promptVersion,_that.modelName,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'flashcard_id')  String flashcardId, @JsonKey(name: 'response_json')  Map<String, dynamic> responseJson, @JsonKey(name: 'prompt_version')  int promptVersion, @JsonKey(name: 'model_name')  String modelName, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AISupportDTO() when $default != null:
return $default(_that.flashcardId,_that.responseJson,_that.promptVersion,_that.modelName,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AISupportDTO implements AISupportDTO {
  const _AISupportDTO({@JsonKey(name: 'flashcard_id') required this.flashcardId, @JsonKey(name: 'response_json') required final  Map<String, dynamic> responseJson, @JsonKey(name: 'prompt_version') required this.promptVersion, @JsonKey(name: 'model_name') required this.modelName, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _responseJson = responseJson;
  factory _AISupportDTO.fromJson(Map<String, dynamic> json) => _$AISupportDTOFromJson(json);

@override@JsonKey(name: 'flashcard_id') final  String flashcardId;
 final  Map<String, dynamic> _responseJson;
@override@JsonKey(name: 'response_json') Map<String, dynamic> get responseJson {
  if (_responseJson is EqualUnmodifiableMapView) return _responseJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_responseJson);
}

@override@JsonKey(name: 'prompt_version') final  int promptVersion;
@override@JsonKey(name: 'model_name') final  String modelName;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of AISupportDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AISupportDTOCopyWith<_AISupportDTO> get copyWith => __$AISupportDTOCopyWithImpl<_AISupportDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AISupportDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AISupportDTO&&(identical(other.flashcardId, flashcardId) || other.flashcardId == flashcardId)&&const DeepCollectionEquality().equals(other._responseJson, _responseJson)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,flashcardId,const DeepCollectionEquality().hash(_responseJson),promptVersion,modelName,expiresAt,createdAt,updatedAt);

@override
String toString() {
  return 'AISupportDTO(flashcardId: $flashcardId, responseJson: $responseJson, promptVersion: $promptVersion, modelName: $modelName, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AISupportDTOCopyWith<$Res> implements $AISupportDTOCopyWith<$Res> {
  factory _$AISupportDTOCopyWith(_AISupportDTO value, $Res Function(_AISupportDTO) _then) = __$AISupportDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'flashcard_id') String flashcardId,@JsonKey(name: 'response_json') Map<String, dynamic> responseJson,@JsonKey(name: 'prompt_version') int promptVersion,@JsonKey(name: 'model_name') String modelName,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$AISupportDTOCopyWithImpl<$Res>
    implements _$AISupportDTOCopyWith<$Res> {
  __$AISupportDTOCopyWithImpl(this._self, this._then);

  final _AISupportDTO _self;
  final $Res Function(_AISupportDTO) _then;

/// Create a copy of AISupportDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? flashcardId = null,Object? responseJson = null,Object? promptVersion = null,Object? modelName = null,Object? expiresAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AISupportDTO(
flashcardId: null == flashcardId ? _self.flashcardId : flashcardId // ignore: cast_nullable_to_non_nullable
as String,responseJson: null == responseJson ? _self._responseJson : responseJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as int,modelName: null == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
