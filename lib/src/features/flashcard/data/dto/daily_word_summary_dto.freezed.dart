// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_word_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyWordSummaryDTO {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'topic_id') int get topicId;@JsonKey(name: 'assigned_date') DateTime get assignedDate;@JsonKey(name: 'topic_name') String get topicName;@JsonKey(name: 'total_words') int get totalWords;@JsonKey(name: 'completed_words') int get completedWords;
/// Create a copy of DailyWordSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyWordSummaryDTOCopyWith<DailyWordSummaryDTO> get copyWith => _$DailyWordSummaryDTOCopyWithImpl<DailyWordSummaryDTO>(this as DailyWordSummaryDTO, _$identity);

  /// Serializes this DailyWordSummaryDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyWordSummaryDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.completedWords, completedWords) || other.completedWords == completedWords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,topicId,assignedDate,topicName,totalWords,completedWords);

@override
String toString() {
  return 'DailyWordSummaryDTO(userId: $userId, topicId: $topicId, assignedDate: $assignedDate, topicName: $topicName, totalWords: $totalWords, completedWords: $completedWords)';
}


}

/// @nodoc
abstract mixin class $DailyWordSummaryDTOCopyWith<$Res>  {
  factory $DailyWordSummaryDTOCopyWith(DailyWordSummaryDTO value, $Res Function(DailyWordSummaryDTO) _then) = _$DailyWordSummaryDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') int topicId,@JsonKey(name: 'assigned_date') DateTime assignedDate,@JsonKey(name: 'topic_name') String topicName,@JsonKey(name: 'total_words') int totalWords,@JsonKey(name: 'completed_words') int completedWords
});




}
/// @nodoc
class _$DailyWordSummaryDTOCopyWithImpl<$Res>
    implements $DailyWordSummaryDTOCopyWith<$Res> {
  _$DailyWordSummaryDTOCopyWithImpl(this._self, this._then);

  final DailyWordSummaryDTO _self;
  final $Res Function(DailyWordSummaryDTO) _then;

/// Create a copy of DailyWordSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? topicId = null,Object? assignedDate = null,Object? topicName = null,Object? totalWords = null,Object? completedWords = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,completedWords: null == completedWords ? _self.completedWords : completedWords // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyWordSummaryDTO].
extension DailyWordSummaryDTOPatterns on DailyWordSummaryDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyWordSummaryDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyWordSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyWordSummaryDTO value)  $default,){
final _that = this;
switch (_that) {
case _DailyWordSummaryDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyWordSummaryDTO value)?  $default,){
final _that = this;
switch (_that) {
case _DailyWordSummaryDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  int topicId, @JsonKey(name: 'assigned_date')  DateTime assignedDate, @JsonKey(name: 'topic_name')  String topicName, @JsonKey(name: 'total_words')  int totalWords, @JsonKey(name: 'completed_words')  int completedWords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyWordSummaryDTO() when $default != null:
return $default(_that.userId,_that.topicId,_that.assignedDate,_that.topicName,_that.totalWords,_that.completedWords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  int topicId, @JsonKey(name: 'assigned_date')  DateTime assignedDate, @JsonKey(name: 'topic_name')  String topicName, @JsonKey(name: 'total_words')  int totalWords, @JsonKey(name: 'completed_words')  int completedWords)  $default,) {final _that = this;
switch (_that) {
case _DailyWordSummaryDTO():
return $default(_that.userId,_that.topicId,_that.assignedDate,_that.topicName,_that.totalWords,_that.completedWords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'topic_id')  int topicId, @JsonKey(name: 'assigned_date')  DateTime assignedDate, @JsonKey(name: 'topic_name')  String topicName, @JsonKey(name: 'total_words')  int totalWords, @JsonKey(name: 'completed_words')  int completedWords)?  $default,) {final _that = this;
switch (_that) {
case _DailyWordSummaryDTO() when $default != null:
return $default(_that.userId,_that.topicId,_that.assignedDate,_that.topicName,_that.totalWords,_that.completedWords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyWordSummaryDTO implements DailyWordSummaryDTO {
  const _DailyWordSummaryDTO({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'topic_id') required this.topicId, @JsonKey(name: 'assigned_date') required this.assignedDate, @JsonKey(name: 'topic_name') required this.topicName, @JsonKey(name: 'total_words') required this.totalWords, @JsonKey(name: 'completed_words') required this.completedWords});
  factory _DailyWordSummaryDTO.fromJson(Map<String, dynamic> json) => _$DailyWordSummaryDTOFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'topic_id') final  int topicId;
@override@JsonKey(name: 'assigned_date') final  DateTime assignedDate;
@override@JsonKey(name: 'topic_name') final  String topicName;
@override@JsonKey(name: 'total_words') final  int totalWords;
@override@JsonKey(name: 'completed_words') final  int completedWords;

/// Create a copy of DailyWordSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyWordSummaryDTOCopyWith<_DailyWordSummaryDTO> get copyWith => __$DailyWordSummaryDTOCopyWithImpl<_DailyWordSummaryDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyWordSummaryDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyWordSummaryDTO&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.completedWords, completedWords) || other.completedWords == completedWords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,topicId,assignedDate,topicName,totalWords,completedWords);

@override
String toString() {
  return 'DailyWordSummaryDTO(userId: $userId, topicId: $topicId, assignedDate: $assignedDate, topicName: $topicName, totalWords: $totalWords, completedWords: $completedWords)';
}


}

/// @nodoc
abstract mixin class _$DailyWordSummaryDTOCopyWith<$Res> implements $DailyWordSummaryDTOCopyWith<$Res> {
  factory _$DailyWordSummaryDTOCopyWith(_DailyWordSummaryDTO value, $Res Function(_DailyWordSummaryDTO) _then) = __$DailyWordSummaryDTOCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'topic_id') int topicId,@JsonKey(name: 'assigned_date') DateTime assignedDate,@JsonKey(name: 'topic_name') String topicName,@JsonKey(name: 'total_words') int totalWords,@JsonKey(name: 'completed_words') int completedWords
});




}
/// @nodoc
class __$DailyWordSummaryDTOCopyWithImpl<$Res>
    implements _$DailyWordSummaryDTOCopyWith<$Res> {
  __$DailyWordSummaryDTOCopyWithImpl(this._self, this._then);

  final _DailyWordSummaryDTO _self;
  final $Res Function(_DailyWordSummaryDTO) _then;

/// Create a copy of DailyWordSummaryDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? topicId = null,Object? assignedDate = null,Object? topicName = null,Object? totalWords = null,Object? completedWords = null,}) {
  return _then(_DailyWordSummaryDTO(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,completedWords: null == completedWords ? _self.completedWords : completedWords // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
