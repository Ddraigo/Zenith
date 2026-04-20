// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_support_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AISupportResponseDTO {

@JsonKey(name: 'cached') bool get cached;@JsonKey(name: 'source') String get source;@JsonKey(name: 'data') Map<String, dynamic> get data;@JsonKey(name: 'meta') Map<String, dynamic> get meta;
/// Create a copy of AISupportResponseDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AISupportResponseDTOCopyWith<AISupportResponseDTO> get copyWith => _$AISupportResponseDTOCopyWithImpl<AISupportResponseDTO>(this as AISupportResponseDTO, _$identity);

  /// Serializes this AISupportResponseDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AISupportResponseDTO&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.data, data)&&const DeepCollectionEquality().equals(other.meta, meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cached,source,const DeepCollectionEquality().hash(data),const DeepCollectionEquality().hash(meta));

@override
String toString() {
  return 'AISupportResponseDTO(cached: $cached, source: $source, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $AISupportResponseDTOCopyWith<$Res>  {
  factory $AISupportResponseDTOCopyWith(AISupportResponseDTO value, $Res Function(AISupportResponseDTO) _then) = _$AISupportResponseDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cached') bool cached,@JsonKey(name: 'source') String source,@JsonKey(name: 'data') Map<String, dynamic> data,@JsonKey(name: 'meta') Map<String, dynamic> meta
});




}
/// @nodoc
class _$AISupportResponseDTOCopyWithImpl<$Res>
    implements $AISupportResponseDTOCopyWith<$Res> {
  _$AISupportResponseDTOCopyWithImpl(this._self, this._then);

  final AISupportResponseDTO _self;
  final $Res Function(AISupportResponseDTO) _then;

/// Create a copy of AISupportResponseDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cached = null,Object? source = null,Object? data = null,Object? meta = null,}) {
  return _then(_self.copyWith(
cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,meta: null == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [AISupportResponseDTO].
extension AISupportResponseDTOPatterns on AISupportResponseDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AISupportResponseDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AISupportResponseDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AISupportResponseDTO value)  $default,){
final _that = this;
switch (_that) {
case _AISupportResponseDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AISupportResponseDTO value)?  $default,){
final _that = this;
switch (_that) {
case _AISupportResponseDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cached')  bool cached, @JsonKey(name: 'source')  String source, @JsonKey(name: 'data')  Map<String, dynamic> data, @JsonKey(name: 'meta')  Map<String, dynamic> meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AISupportResponseDTO() when $default != null:
return $default(_that.cached,_that.source,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cached')  bool cached, @JsonKey(name: 'source')  String source, @JsonKey(name: 'data')  Map<String, dynamic> data, @JsonKey(name: 'meta')  Map<String, dynamic> meta)  $default,) {final _that = this;
switch (_that) {
case _AISupportResponseDTO():
return $default(_that.cached,_that.source,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cached')  bool cached, @JsonKey(name: 'source')  String source, @JsonKey(name: 'data')  Map<String, dynamic> data, @JsonKey(name: 'meta')  Map<String, dynamic> meta)?  $default,) {final _that = this;
switch (_that) {
case _AISupportResponseDTO() when $default != null:
return $default(_that.cached,_that.source,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AISupportResponseDTO implements AISupportResponseDTO {
  const _AISupportResponseDTO({@JsonKey(name: 'cached') required this.cached, @JsonKey(name: 'source') required this.source, @JsonKey(name: 'data') required final  Map<String, dynamic> data, @JsonKey(name: 'meta') required final  Map<String, dynamic> meta}): _data = data,_meta = meta;
  factory _AISupportResponseDTO.fromJson(Map<String, dynamic> json) => _$AISupportResponseDTOFromJson(json);

@override@JsonKey(name: 'cached') final  bool cached;
@override@JsonKey(name: 'source') final  String source;
 final  Map<String, dynamic> _data;
@override@JsonKey(name: 'data') Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}

 final  Map<String, dynamic> _meta;
@override@JsonKey(name: 'meta') Map<String, dynamic> get meta {
  if (_meta is EqualUnmodifiableMapView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_meta);
}


/// Create a copy of AISupportResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AISupportResponseDTOCopyWith<_AISupportResponseDTO> get copyWith => __$AISupportResponseDTOCopyWithImpl<_AISupportResponseDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AISupportResponseDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AISupportResponseDTO&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other._data, _data)&&const DeepCollectionEquality().equals(other._meta, _meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cached,source,const DeepCollectionEquality().hash(_data),const DeepCollectionEquality().hash(_meta));

@override
String toString() {
  return 'AISupportResponseDTO(cached: $cached, source: $source, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$AISupportResponseDTOCopyWith<$Res> implements $AISupportResponseDTOCopyWith<$Res> {
  factory _$AISupportResponseDTOCopyWith(_AISupportResponseDTO value, $Res Function(_AISupportResponseDTO) _then) = __$AISupportResponseDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cached') bool cached,@JsonKey(name: 'source') String source,@JsonKey(name: 'data') Map<String, dynamic> data,@JsonKey(name: 'meta') Map<String, dynamic> meta
});




}
/// @nodoc
class __$AISupportResponseDTOCopyWithImpl<$Res>
    implements _$AISupportResponseDTOCopyWith<$Res> {
  __$AISupportResponseDTOCopyWithImpl(this._self, this._then);

  final _AISupportResponseDTO _self;
  final $Res Function(_AISupportResponseDTO) _then;

/// Create a copy of AISupportResponseDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cached = null,Object? source = null,Object? data = null,Object? meta = null,}) {
  return _then(_AISupportResponseDTO(
cached: null == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,meta: null == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
