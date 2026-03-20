// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException()';
}


}

/// @nodoc
class $AppExceptionCopyWith<$Res>  {
$AppExceptionCopyWith(AppException _, $Res Function(AppException) __);
}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppExceptionConnectivity value)?  connectivity,TResult Function( AppExceptionUnauthorized value)?  unauthorized,TResult Function( _AppExceptionErrorMessage value)?  errorWithMessage,TResult Function( _AppExceptionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppExceptionConnectivity() when connectivity != null:
return connectivity(_that);case AppExceptionUnauthorized() when unauthorized != null:
return unauthorized(_that);case _AppExceptionErrorMessage() when errorWithMessage != null:
return errorWithMessage(_that);case _AppExceptionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppExceptionConnectivity value)  connectivity,required TResult Function( AppExceptionUnauthorized value)  unauthorized,required TResult Function( _AppExceptionErrorMessage value)  errorWithMessage,required TResult Function( _AppExceptionError value)  error,}){
final _that = this;
switch (_that) {
case AppExceptionConnectivity():
return connectivity(_that);case AppExceptionUnauthorized():
return unauthorized(_that);case _AppExceptionErrorMessage():
return errorWithMessage(_that);case _AppExceptionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppExceptionConnectivity value)?  connectivity,TResult? Function( AppExceptionUnauthorized value)?  unauthorized,TResult? Function( _AppExceptionErrorMessage value)?  errorWithMessage,TResult? Function( _AppExceptionError value)?  error,}){
final _that = this;
switch (_that) {
case AppExceptionConnectivity() when connectivity != null:
return connectivity(_that);case AppExceptionUnauthorized() when unauthorized != null:
return unauthorized(_that);case _AppExceptionErrorMessage() when errorWithMessage != null:
return errorWithMessage(_that);case _AppExceptionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  connectivity,TResult Function()?  unauthorized,TResult Function( String message)?  errorWithMessage,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppExceptionConnectivity() when connectivity != null:
return connectivity();case AppExceptionUnauthorized() when unauthorized != null:
return unauthorized();case _AppExceptionErrorMessage() when errorWithMessage != null:
return errorWithMessage(_that.message);case _AppExceptionError() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  connectivity,required TResult Function()  unauthorized,required TResult Function( String message)  errorWithMessage,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case AppExceptionConnectivity():
return connectivity();case AppExceptionUnauthorized():
return unauthorized();case _AppExceptionErrorMessage():
return errorWithMessage(_that.message);case _AppExceptionError():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  connectivity,TResult? Function()?  unauthorized,TResult? Function( String message)?  errorWithMessage,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case AppExceptionConnectivity() when connectivity != null:
return connectivity();case AppExceptionUnauthorized() when unauthorized != null:
return unauthorized();case _AppExceptionErrorMessage() when errorWithMessage != null:
return errorWithMessage(_that.message);case _AppExceptionError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class AppExceptionConnectivity implements AppException {
  const AppExceptionConnectivity();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppExceptionConnectivity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.connectivity()';
}


}




/// @nodoc


class AppExceptionUnauthorized implements AppException {
  const AppExceptionUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppExceptionUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.unauthorized()';
}


}




/// @nodoc


class _AppExceptionErrorMessage implements AppException {
  const _AppExceptionErrorMessage(this.message);
  

 final  String message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppExceptionErrorMessageCopyWith<_AppExceptionErrorMessage> get copyWith => __$AppExceptionErrorMessageCopyWithImpl<_AppExceptionErrorMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppExceptionErrorMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.errorWithMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class _$AppExceptionErrorMessageCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory _$AppExceptionErrorMessageCopyWith(_AppExceptionErrorMessage value, $Res Function(_AppExceptionErrorMessage) _then) = __$AppExceptionErrorMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$AppExceptionErrorMessageCopyWithImpl<$Res>
    implements _$AppExceptionErrorMessageCopyWith<$Res> {
  __$AppExceptionErrorMessageCopyWithImpl(this._self, this._then);

  final _AppExceptionErrorMessage _self;
  final $Res Function(_AppExceptionErrorMessage) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_AppExceptionErrorMessage(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AppExceptionError implements AppException {
  const _AppExceptionError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppExceptionError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.error()';
}


}




// dart format on
