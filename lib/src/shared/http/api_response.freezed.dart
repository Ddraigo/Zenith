// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$APIResponse<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is APIResponse<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'APIResponse<$T>()';
}


}

/// @nodoc
class $APIResponseCopyWith<T,$Res>  {
$APIResponseCopyWith(APIResponse<T> _, $Res Function(APIResponse<T>) __);
}


/// Adds pattern-matching-related methods to [APIResponse].
extension APIResponsePatterns<T> on APIResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( APISuccess<T> value)?  success,TResult Function( APIError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case APISuccess() when success != null:
return success(_that);case APIError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( APISuccess<T> value)  success,required TResult Function( APIError<T> value)  error,}){
final _that = this;
switch (_that) {
case APISuccess():
return success(_that);case APIError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( APISuccess<T> value)?  success,TResult? Function( APIError<T> value)?  error,}){
final _that = this;
switch (_that) {
case APISuccess() when success != null:
return success(_that);case APIError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T value)?  success,TResult Function( AppException exception)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case APISuccess() when success != null:
return success(_that.value);case APIError() when error != null:
return error(_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T value)  success,required TResult Function( AppException exception)  error,}) {final _that = this;
switch (_that) {
case APISuccess():
return success(_that.value);case APIError():
return error(_that.exception);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T value)?  success,TResult? Function( AppException exception)?  error,}) {final _that = this;
switch (_that) {
case APISuccess() when success != null:
return success(_that.value);case APIError() when error != null:
return error(_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class APISuccess<T> implements APIResponse<T> {
  const APISuccess(this.value);
  

 final  T value;

/// Create a copy of APIResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$APISuccessCopyWith<T, APISuccess<T>> get copyWith => _$APISuccessCopyWithImpl<T, APISuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is APISuccess<T>&&const DeepCollectionEquality().equals(other.value, value));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(value));

@override
String toString() {
  return 'APIResponse<$T>.success(value: $value)';
}


}

/// @nodoc
abstract mixin class $APISuccessCopyWith<T,$Res> implements $APIResponseCopyWith<T, $Res> {
  factory $APISuccessCopyWith(APISuccess<T> value, $Res Function(APISuccess<T>) _then) = _$APISuccessCopyWithImpl;
@useResult
$Res call({
 T value
});




}
/// @nodoc
class _$APISuccessCopyWithImpl<T,$Res>
    implements $APISuccessCopyWith<T, $Res> {
  _$APISuccessCopyWithImpl(this._self, this._then);

  final APISuccess<T> _self;
  final $Res Function(APISuccess<T>) _then;

/// Create a copy of APIResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(APISuccess<T>(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class APIError<T> implements APIResponse<T> {
  const APIError(this.exception);
  

 final  AppException exception;

/// Create a copy of APIResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$APIErrorCopyWith<T, APIError<T>> get copyWith => _$APIErrorCopyWithImpl<T, APIError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is APIError<T>&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'APIResponse<$T>.error(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $APIErrorCopyWith<T,$Res> implements $APIResponseCopyWith<T, $Res> {
  factory $APIErrorCopyWith(APIError<T> value, $Res Function(APIError<T>) _then) = _$APIErrorCopyWithImpl;
@useResult
$Res call({
 AppException exception
});


$AppExceptionCopyWith<$Res> get exception;

}
/// @nodoc
class _$APIErrorCopyWithImpl<T,$Res>
    implements $APIErrorCopyWith<T, $Res> {
  _$APIErrorCopyWithImpl(this._self, this._then);

  final APIError<T> _self;
  final $Res Function(APIError<T>) _then;

/// Create a copy of APIResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(APIError<T>(
null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as AppException,
  ));
}

/// Create a copy of APIResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<$Res> get exception {
  
  return $AppExceptionCopyWith<$Res>(_self.exception, (value) {
    return _then(_self.copyWith(exception: value));
  });
}
}

// dart format on
