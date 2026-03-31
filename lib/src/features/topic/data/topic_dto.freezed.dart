// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicDTO {

 int get id; String get name;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of TopicDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicDTOCopyWith<TopicDTO> get copyWith => _$TopicDTOCopyWithImpl<TopicDTO>(this as TopicDTO, _$identity);

  /// Serializes this TopicDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt);

@override
String toString() {
  return 'TopicDTO(id: $id, name: $name, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TopicDTOCopyWith<$Res>  {
  factory $TopicDTOCopyWith(TopicDTO value, $Res Function(TopicDTO) _then) = _$TopicDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$TopicDTOCopyWithImpl<$Res>
    implements $TopicDTOCopyWith<$Res> {
  _$TopicDTOCopyWithImpl(this._self, this._then);

  final TopicDTO _self;
  final $Res Function(TopicDTO) _then;

/// Create a copy of TopicDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicDTO].
extension TopicDTOPatterns on TopicDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicDTO value)  $default,){
final _that = this;
switch (_that) {
case _TopicDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicDTO value)?  $default,){
final _that = this;
switch (_that) {
case _TopicDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDTO() when $default != null:
return $default(_that.id,_that.name,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TopicDTO():
return $default(_that.id,_that.name,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TopicDTO() when $default != null:
return $default(_that.id,_that.name,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicDTO implements TopicDTO {
  const _TopicDTO({required this.id, required this.name, @JsonKey(name: 'created_at') this.createdAt});
  factory _TopicDTO.fromJson(Map<String, dynamic> json) => _$TopicDTOFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of TopicDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicDTOCopyWith<_TopicDTO> get copyWith => __$TopicDTOCopyWithImpl<_TopicDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdAt);

@override
String toString() {
  return 'TopicDTO(id: $id, name: $name, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TopicDTOCopyWith<$Res> implements $TopicDTOCopyWith<$Res> {
  factory _$TopicDTOCopyWith(_TopicDTO value, $Res Function(_TopicDTO) _then) = __$TopicDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$TopicDTOCopyWithImpl<$Res>
    implements _$TopicDTOCopyWith<$Res> {
  __$TopicDTOCopyWithImpl(this._self, this._then);

  final _TopicDTO _self;
  final $Res Function(_TopicDTO) _then;

/// Create a copy of TopicDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdAt = freezed,}) {
  return _then(_TopicDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
