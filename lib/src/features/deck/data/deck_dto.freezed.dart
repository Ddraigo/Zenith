// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeckDTO {

 String get id; String get name;@JsonKey(name: 'learning_type_id') String? get learningTypeId;@JsonKey(name: 'topic_id') String? get topicId; String? get level; String? get description;@JsonKey(name: 'cover_image_url') String? get imageUrl;@JsonKey(name: 'created_by') String get createdBy;@JsonKey(name: 'is_system') bool get isSystem;@JsonKey(name: 'is_public') bool get isPublic;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of DeckDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckDTOCopyWith<DeckDTO> get copyWith => _$DeckDTOCopyWithImpl<DeckDTO>(this as DeckDTO, _$identity);

  /// Serializes this DeckDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.learningTypeId, learningTypeId) || other.learningTypeId == learningTypeId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,learningTypeId,topicId,level,description,imageUrl,createdBy,isSystem,isPublic,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DeckDTO(id: $id, name: $name, learningTypeId: $learningTypeId, topicId: $topicId, level: $level, description: $description, imageUrl: $imageUrl, createdBy: $createdBy, isSystem: $isSystem, isPublic: $isPublic, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DeckDTOCopyWith<$Res>  {
  factory $DeckDTOCopyWith(DeckDTO value, $Res Function(DeckDTO) _then) = _$DeckDTOCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'learning_type_id') String? learningTypeId,@JsonKey(name: 'topic_id') String? topicId, String? level, String? description,@JsonKey(name: 'cover_image_url') String? imageUrl,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'is_system') bool isSystem,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$DeckDTOCopyWithImpl<$Res>
    implements $DeckDTOCopyWith<$Res> {
  _$DeckDTOCopyWithImpl(this._self, this._then);

  final DeckDTO _self;
  final $Res Function(DeckDTO) _then;

/// Create a copy of DeckDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? learningTypeId = freezed,Object? topicId = freezed,Object? level = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? createdBy = null,Object? isSystem = null,Object? isPublic = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,learningTypeId: freezed == learningTypeId ? _self.learningTypeId : learningTypeId // ignore: cast_nullable_to_non_nullable
as String?,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeckDTO].
extension DeckDTOPatterns on DeckDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeckDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeckDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeckDTO value)  $default,){
final _that = this;
switch (_that) {
case _DeckDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeckDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DeckDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'learning_type_id')  String? learningTypeId, @JsonKey(name: 'topic_id')  String? topicId,  String? level,  String? description, @JsonKey(name: 'cover_image_url')  String? imageUrl, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'is_system')  bool isSystem, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeckDTO() when $default != null:
return $default(_that.id,_that.name,_that.learningTypeId,_that.topicId,_that.level,_that.description,_that.imageUrl,_that.createdBy,_that.isSystem,_that.isPublic,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'learning_type_id')  String? learningTypeId, @JsonKey(name: 'topic_id')  String? topicId,  String? level,  String? description, @JsonKey(name: 'cover_image_url')  String? imageUrl, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'is_system')  bool isSystem, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeckDTO():
return $default(_that.id,_that.name,_that.learningTypeId,_that.topicId,_that.level,_that.description,_that.imageUrl,_that.createdBy,_that.isSystem,_that.isPublic,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'learning_type_id')  String? learningTypeId, @JsonKey(name: 'topic_id')  String? topicId,  String? level,  String? description, @JsonKey(name: 'cover_image_url')  String? imageUrl, @JsonKey(name: 'created_by')  String createdBy, @JsonKey(name: 'is_system')  bool isSystem, @JsonKey(name: 'is_public')  bool isPublic, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeckDTO() when $default != null:
return $default(_that.id,_that.name,_that.learningTypeId,_that.topicId,_that.level,_that.description,_that.imageUrl,_that.createdBy,_that.isSystem,_that.isPublic,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeckDTO implements DeckDTO {
  const _DeckDTO({required this.id, required this.name, @JsonKey(name: 'learning_type_id') this.learningTypeId, @JsonKey(name: 'topic_id') this.topicId, this.level, this.description, @JsonKey(name: 'cover_image_url') this.imageUrl, @JsonKey(name: 'created_by') required this.createdBy, @JsonKey(name: 'is_system') required this.isSystem, @JsonKey(name: 'is_public') required this.isPublic, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _DeckDTO.fromJson(Map<String, dynamic> json) => _$DeckDTOFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'learning_type_id') final  String? learningTypeId;
@override@JsonKey(name: 'topic_id') final  String? topicId;
@override final  String? level;
@override final  String? description;
@override@JsonKey(name: 'cover_image_url') final  String? imageUrl;
@override@JsonKey(name: 'created_by') final  String createdBy;
@override@JsonKey(name: 'is_system') final  bool isSystem;
@override@JsonKey(name: 'is_public') final  bool isPublic;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of DeckDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeckDTOCopyWith<_DeckDTO> get copyWith => __$DeckDTOCopyWithImpl<_DeckDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeckDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeckDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.learningTypeId, learningTypeId) || other.learningTypeId == learningTypeId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,learningTypeId,topicId,level,description,imageUrl,createdBy,isSystem,isPublic,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DeckDTO(id: $id, name: $name, learningTypeId: $learningTypeId, topicId: $topicId, level: $level, description: $description, imageUrl: $imageUrl, createdBy: $createdBy, isSystem: $isSystem, isPublic: $isPublic, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeckDTOCopyWith<$Res> implements $DeckDTOCopyWith<$Res> {
  factory _$DeckDTOCopyWith(_DeckDTO value, $Res Function(_DeckDTO) _then) = __$DeckDTOCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'learning_type_id') String? learningTypeId,@JsonKey(name: 'topic_id') String? topicId, String? level, String? description,@JsonKey(name: 'cover_image_url') String? imageUrl,@JsonKey(name: 'created_by') String createdBy,@JsonKey(name: 'is_system') bool isSystem,@JsonKey(name: 'is_public') bool isPublic,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$DeckDTOCopyWithImpl<$Res>
    implements _$DeckDTOCopyWith<$Res> {
  __$DeckDTOCopyWithImpl(this._self, this._then);

  final _DeckDTO _self;
  final $Res Function(_DeckDTO) _then;

/// Create a copy of DeckDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? learningTypeId = freezed,Object? topicId = freezed,Object? level = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? createdBy = null,Object? isSystem = null,Object? isPublic = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DeckDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,learningTypeId: freezed == learningTypeId ? _self.learningTypeId : learningTypeId // ignore: cast_nullable_to_non_nullable
as String?,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
