// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppStartState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppStartState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState()';
}


}

/// @nodoc
class $AppStartStateCopyWith<$Res>  {
$AppStartStateCopyWith(AppStartState _, $Res Function(AppStartState) __);
}


/// Adds pattern-matching-related methods to [AppStartState].
extension AppStartStatePatterns on AppStartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Unauthenticated value)?  unauthenticated,TResult Function( _InternetUnAvaiable value)?  internetUnAvaiable,TResult Function( AppAuthenticated value)?  authenticated,TResult Function( AppAuthenticatedAnonymous value)?  authenticatedAnonymous,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _InternetUnAvaiable() when internetUnAvaiable != null:
return internetUnAvaiable(_that);case AppAuthenticated() when authenticated != null:
return authenticated(_that);case AppAuthenticatedAnonymous() when authenticatedAnonymous != null:
return authenticatedAnonymous(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Unauthenticated value)  unauthenticated,required TResult Function( _InternetUnAvaiable value)  internetUnAvaiable,required TResult Function( AppAuthenticated value)  authenticated,required TResult Function( AppAuthenticatedAnonymous value)  authenticatedAnonymous,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Unauthenticated():
return unauthenticated(_that);case _InternetUnAvaiable():
return internetUnAvaiable(_that);case AppAuthenticated():
return authenticated(_that);case AppAuthenticatedAnonymous():
return authenticatedAnonymous(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Unauthenticated value)?  unauthenticated,TResult? Function( _InternetUnAvaiable value)?  internetUnAvaiable,TResult? Function( AppAuthenticated value)?  authenticated,TResult? Function( AppAuthenticatedAnonymous value)?  authenticatedAnonymous,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Unauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _InternetUnAvaiable() when internetUnAvaiable != null:
return internetUnAvaiable(_that);case AppAuthenticated() when authenticated != null:
return authenticated(_that);case AppAuthenticatedAnonymous() when authenticatedAnonymous != null:
return authenticatedAnonymous(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  unauthenticated,TResult Function()?  internetUnAvaiable,TResult Function()?  authenticated,TResult Function()?  authenticatedAnonymous,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Unauthenticated() when unauthenticated != null:
return unauthenticated();case _InternetUnAvaiable() when internetUnAvaiable != null:
return internetUnAvaiable();case AppAuthenticated() when authenticated != null:
return authenticated();case AppAuthenticatedAnonymous() when authenticatedAnonymous != null:
return authenticatedAnonymous();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  unauthenticated,required TResult Function()  internetUnAvaiable,required TResult Function()  authenticated,required TResult Function()  authenticatedAnonymous,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Unauthenticated():
return unauthenticated();case _InternetUnAvaiable():
return internetUnAvaiable();case AppAuthenticated():
return authenticated();case AppAuthenticatedAnonymous():
return authenticatedAnonymous();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  unauthenticated,TResult? Function()?  internetUnAvaiable,TResult? Function()?  authenticated,TResult? Function()?  authenticatedAnonymous,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Unauthenticated() when unauthenticated != null:
return unauthenticated();case _InternetUnAvaiable() when internetUnAvaiable != null:
return internetUnAvaiable();case AppAuthenticated() when authenticated != null:
return authenticated();case AppAuthenticatedAnonymous() when authenticatedAnonymous != null:
return authenticatedAnonymous();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppStartState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.initial()';
}


}




/// @nodoc


class Unauthenticated implements AppStartState {
  const Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.unauthenticated()';
}


}




/// @nodoc


class _InternetUnAvaiable implements AppStartState {
  const _InternetUnAvaiable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternetUnAvaiable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.internetUnAvaiable()';
}


}




/// @nodoc


class AppAuthenticated implements AppStartState {
  const AppAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.authenticated()';
}


}




/// @nodoc


class AppAuthenticatedAnonymous implements AppStartState {
  const AppAuthenticatedAnonymous();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppAuthenticatedAnonymous);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppStartState.authenticatedAnonymous()';
}


}




// dart format on
