// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_word_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyWordSummaryModel {

 String get userId; int get topicId; DateTime get assignedDate; String get topicName; int get totalWords; int? get completedWords;
/// Create a copy of DailyWordSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyWordSummaryModelCopyWith<DailyWordSummaryModel> get copyWith => _$DailyWordSummaryModelCopyWithImpl<DailyWordSummaryModel>(this as DailyWordSummaryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyWordSummaryModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.completedWords, completedWords) || other.completedWords == completedWords));
}


@override
int get hashCode => Object.hash(runtimeType,userId,topicId,assignedDate,topicName,totalWords,completedWords);

@override
String toString() {
  return 'DailyWordSummaryModel(userId: $userId, topicId: $topicId, assignedDate: $assignedDate, topicName: $topicName, totalWords: $totalWords, completedWords: $completedWords)';
}


}

/// @nodoc
abstract mixin class $DailyWordSummaryModelCopyWith<$Res>  {
  factory $DailyWordSummaryModelCopyWith(DailyWordSummaryModel value, $Res Function(DailyWordSummaryModel) _then) = _$DailyWordSummaryModelCopyWithImpl;
@useResult
$Res call({
 String userId, int topicId, DateTime assignedDate, String topicName, int totalWords, int? completedWords
});




}
/// @nodoc
class _$DailyWordSummaryModelCopyWithImpl<$Res>
    implements $DailyWordSummaryModelCopyWith<$Res> {
  _$DailyWordSummaryModelCopyWithImpl(this._self, this._then);

  final DailyWordSummaryModel _self;
  final $Res Function(DailyWordSummaryModel) _then;

/// Create a copy of DailyWordSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? topicId = null,Object? assignedDate = null,Object? topicName = null,Object? totalWords = null,Object? completedWords = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,completedWords: freezed == completedWords ? _self.completedWords : completedWords // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyWordSummaryModel].
extension DailyWordSummaryModelPatterns on DailyWordSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyWordSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyWordSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyWordSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _DailyWordSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyWordSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailyWordSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int topicId,  DateTime assignedDate,  String topicName,  int totalWords,  int? completedWords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyWordSummaryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int topicId,  DateTime assignedDate,  String topicName,  int totalWords,  int? completedWords)  $default,) {final _that = this;
switch (_that) {
case _DailyWordSummaryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int topicId,  DateTime assignedDate,  String topicName,  int totalWords,  int? completedWords)?  $default,) {final _that = this;
switch (_that) {
case _DailyWordSummaryModel() when $default != null:
return $default(_that.userId,_that.topicId,_that.assignedDate,_that.topicName,_that.totalWords,_that.completedWords);case _:
  return null;

}
}

}

/// @nodoc


class _DailyWordSummaryModel extends DailyWordSummaryModel {
  const _DailyWordSummaryModel({required this.userId, required this.topicId, required this.assignedDate, required this.topicName, required this.totalWords, this.completedWords = 0}): super._();
  

@override final  String userId;
@override final  int topicId;
@override final  DateTime assignedDate;
@override final  String topicName;
@override final  int totalWords;
@override@JsonKey() final  int? completedWords;

/// Create a copy of DailyWordSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyWordSummaryModelCopyWith<_DailyWordSummaryModel> get copyWith => __$DailyWordSummaryModelCopyWithImpl<_DailyWordSummaryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyWordSummaryModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.topicId, topicId) || other.topicId == topicId)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.completedWords, completedWords) || other.completedWords == completedWords));
}


@override
int get hashCode => Object.hash(runtimeType,userId,topicId,assignedDate,topicName,totalWords,completedWords);

@override
String toString() {
  return 'DailyWordSummaryModel(userId: $userId, topicId: $topicId, assignedDate: $assignedDate, topicName: $topicName, totalWords: $totalWords, completedWords: $completedWords)';
}


}

/// @nodoc
abstract mixin class _$DailyWordSummaryModelCopyWith<$Res> implements $DailyWordSummaryModelCopyWith<$Res> {
  factory _$DailyWordSummaryModelCopyWith(_DailyWordSummaryModel value, $Res Function(_DailyWordSummaryModel) _then) = __$DailyWordSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, int topicId, DateTime assignedDate, String topicName, int totalWords, int? completedWords
});




}
/// @nodoc
class __$DailyWordSummaryModelCopyWithImpl<$Res>
    implements _$DailyWordSummaryModelCopyWith<$Res> {
  __$DailyWordSummaryModelCopyWithImpl(this._self, this._then);

  final _DailyWordSummaryModel _self;
  final $Res Function(_DailyWordSummaryModel) _then;

/// Create a copy of DailyWordSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? topicId = null,Object? assignedDate = null,Object? topicName = null,Object? totalWords = null,Object? completedWords = freezed,}) {
  return _then(_DailyWordSummaryModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,topicId: null == topicId ? _self.topicId : topicId // ignore: cast_nullable_to_non_nullable
as int,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as DateTime,topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,completedWords: freezed == completedWords ? _self.completedWords : completedWords // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
