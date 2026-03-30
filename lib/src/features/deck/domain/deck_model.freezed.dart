// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeckModel {

 String? get id; String get name; String? get learningTypeId; String? get topicId; String? get level; String? get description; String? get imageUrl; String? get createdBy; bool get isSystem; bool get isPublic; bool get isActive; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of DeckModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckModelCopyWith<DeckModel> get copyWith => _$DeckModelCopyWithImpl<DeckModel>(this as DeckModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.learningTypeId, learningTypeId) || other.learningTypeId == learningTypeId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,learningTypeId,topicId,level,description,imageUrl,createdBy,isSystem,isPublic,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DeckModel(id: $id, name: $name, learningTypeId: $learningTypeId, topicId: $topicId, level: $level, description: $description, imageUrl: $imageUrl, createdBy: $createdBy, isSystem: $isSystem, isPublic: $isPublic, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DeckModelCopyWith<$Res>  {
  factory $DeckModelCopyWith(DeckModel value, $Res Function(DeckModel) _then) = _$DeckModelCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String? learningTypeId, String? topicId, String? level, String? description, String? imageUrl, String? createdBy, bool isSystem, bool isPublic, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$DeckModelCopyWithImpl<$Res>
    implements $DeckModelCopyWith<$Res> {
  _$DeckModelCopyWithImpl(this._self, this._then);

  final DeckModel _self;
  final $Res Function(DeckModel) _then;

/// Create a copy of DeckModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? learningTypeId = freezed,Object? topicId = freezed,Object? level = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? createdBy = freezed,Object? isSystem = null,Object? isPublic = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,learningTypeId: freezed == learningTypeId ? _self.learningTypeId : learningTypeId // ignore: cast_nullable_to_non_nullable
as String?,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeckModel].
extension DeckModelPatterns on DeckModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeckModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeckModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeckModel value)  $default,){
final _that = this;
switch (_that) {
case _DeckModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeckModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeckModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String? learningTypeId,  String? topicId,  String? level,  String? description,  String? imageUrl,  String? createdBy,  bool isSystem,  bool isPublic,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeckModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String? learningTypeId,  String? topicId,  String? level,  String? description,  String? imageUrl,  String? createdBy,  bool isSystem,  bool isPublic,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeckModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String? learningTypeId,  String? topicId,  String? level,  String? description,  String? imageUrl,  String? createdBy,  bool isSystem,  bool isPublic,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeckModel() when $default != null:
return $default(_that.id,_that.name,_that.learningTypeId,_that.topicId,_that.level,_that.description,_that.imageUrl,_that.createdBy,_that.isSystem,_that.isPublic,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DeckModel implements DeckModel {
  const _DeckModel({this.id, required this.name, this.learningTypeId, this.topicId, this.level, this.description, this.imageUrl, this.createdBy, required this.isSystem, required this.isPublic, required this.isActive, this.createdAt, this.updatedAt});
  

@override final  String? id;
@override final  String name;
@override final  String? learningTypeId;
@override final  String? topicId;
@override final  String? level;
@override final  String? description;
@override final  String? imageUrl;
@override final  String? createdBy;
@override final  bool isSystem;
@override final  bool isPublic;
@override final  bool isActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of DeckModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeckModelCopyWith<_DeckModel> get copyWith => __$DeckModelCopyWithImpl<_DeckModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeckModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.learningTypeId, learningTypeId) || other.learningTypeId == learningTypeId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.level, level) || other.level == level)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.isSystem, isSystem) || other.isSystem == isSystem)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,learningTypeId,topicId,level,description,imageUrl,createdBy,isSystem,isPublic,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DeckModel(id: $id, name: $name, learningTypeId: $learningTypeId, topicId: $topicId, level: $level, description: $description, imageUrl: $imageUrl, createdBy: $createdBy, isSystem: $isSystem, isPublic: $isPublic, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeckModelCopyWith<$Res> implements $DeckModelCopyWith<$Res> {
  factory _$DeckModelCopyWith(_DeckModel value, $Res Function(_DeckModel) _then) = __$DeckModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String? learningTypeId, String? topicId, String? level, String? description, String? imageUrl, String? createdBy, bool isSystem, bool isPublic, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$DeckModelCopyWithImpl<$Res>
    implements _$DeckModelCopyWith<$Res> {
  __$DeckModelCopyWithImpl(this._self, this._then);

  final _DeckModel _self;
  final $Res Function(_DeckModel) _then;

/// Create a copy of DeckModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? learningTypeId = freezed,Object? topicId = freezed,Object? level = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? createdBy = freezed,Object? isSystem = null,Object? isPublic = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_DeckModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,learningTypeId: freezed == learningTypeId ? _self.learningTypeId : learningTypeId // ignore: cast_nullable_to_non_nullable
as String?,topicId: freezed == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,isSystem: null == isSystem ? _self.isSystem : isSystem // ignore: cast_nullable_to_non_nullable
as bool,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
