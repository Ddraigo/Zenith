// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_pass_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgotPasswordState {

 ForgotPhase get phase; bool get isSendingCode; bool get isConfirming; String? get otpError; String? get passwordError; String? get rePasswordError; String? get emailError;
/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith => _$ForgotPasswordStateCopyWithImpl<ForgotPasswordState>(this as ForgotPasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgotPasswordState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isSendingCode, isSendingCode) || other.isSendingCode == isSendingCode)&&(identical(other.isConfirming, isConfirming) || other.isConfirming == isConfirming)&&(identical(other.otpError, otpError) || other.otpError == otpError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.rePasswordError, rePasswordError) || other.rePasswordError == rePasswordError)&&(identical(other.emailError, emailError) || other.emailError == emailError));
}


@override
int get hashCode => Object.hash(runtimeType,phase,isSendingCode,isConfirming,otpError,passwordError,rePasswordError,emailError);

@override
String toString() {
  return 'ForgotPasswordState(phase: $phase, isSendingCode: $isSendingCode, isConfirming: $isConfirming, otpError: $otpError, passwordError: $passwordError, rePasswordError: $rePasswordError, emailError: $emailError)';
}


}

/// @nodoc
abstract mixin class $ForgotPasswordStateCopyWith<$Res>  {
  factory $ForgotPasswordStateCopyWith(ForgotPasswordState value, $Res Function(ForgotPasswordState) _then) = _$ForgotPasswordStateCopyWithImpl;
@useResult
$Res call({
 ForgotPhase phase, bool isSendingCode, bool isConfirming, String? otpError, String? passwordError, String? rePasswordError, String? emailError
});




}
/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordState _self;
  final $Res Function(ForgotPasswordState) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? isSendingCode = null,Object? isConfirming = null,Object? otpError = freezed,Object? passwordError = freezed,Object? rePasswordError = freezed,Object? emailError = freezed,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ForgotPhase,isSendingCode: null == isSendingCode ? _self.isSendingCode : isSendingCode // ignore: cast_nullable_to_non_nullable
as bool,isConfirming: null == isConfirming ? _self.isConfirming : isConfirming // ignore: cast_nullable_to_non_nullable
as bool,otpError: freezed == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,rePasswordError: freezed == rePasswordError ? _self.rePasswordError : rePasswordError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ForgotPasswordState].
extension ForgotPasswordStatePatterns on ForgotPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForgotPasswordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForgotPasswordState value)  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForgotPasswordState value)?  $default,){
final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ForgotPhase phase,  bool isSendingCode,  bool isConfirming,  String? otpError,  String? passwordError,  String? rePasswordError,  String? emailError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that.phase,_that.isSendingCode,_that.isConfirming,_that.otpError,_that.passwordError,_that.rePasswordError,_that.emailError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ForgotPhase phase,  bool isSendingCode,  bool isConfirming,  String? otpError,  String? passwordError,  String? rePasswordError,  String? emailError)  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordState():
return $default(_that.phase,_that.isSendingCode,_that.isConfirming,_that.otpError,_that.passwordError,_that.rePasswordError,_that.emailError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ForgotPhase phase,  bool isSendingCode,  bool isConfirming,  String? otpError,  String? passwordError,  String? rePasswordError,  String? emailError)?  $default,) {final _that = this;
switch (_that) {
case _ForgotPasswordState() when $default != null:
return $default(_that.phase,_that.isSendingCode,_that.isConfirming,_that.otpError,_that.passwordError,_that.rePasswordError,_that.emailError);case _:
  return null;

}
}

}

/// @nodoc


class _ForgotPasswordState extends ForgotPasswordState {
  const _ForgotPasswordState({this.phase = ForgotPhase.requestCode, this.isSendingCode = false, this.isConfirming = false, this.otpError, this.passwordError, this.rePasswordError, this.emailError}): super._();
  

@override@JsonKey() final  ForgotPhase phase;
@override@JsonKey() final  bool isSendingCode;
@override@JsonKey() final  bool isConfirming;
@override final  String? otpError;
@override final  String? passwordError;
@override final  String? rePasswordError;
@override final  String? emailError;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForgotPasswordStateCopyWith<_ForgotPasswordState> get copyWith => __$ForgotPasswordStateCopyWithImpl<_ForgotPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPasswordState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.isSendingCode, isSendingCode) || other.isSendingCode == isSendingCode)&&(identical(other.isConfirming, isConfirming) || other.isConfirming == isConfirming)&&(identical(other.otpError, otpError) || other.otpError == otpError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.rePasswordError, rePasswordError) || other.rePasswordError == rePasswordError)&&(identical(other.emailError, emailError) || other.emailError == emailError));
}


@override
int get hashCode => Object.hash(runtimeType,phase,isSendingCode,isConfirming,otpError,passwordError,rePasswordError,emailError);

@override
String toString() {
  return 'ForgotPasswordState(phase: $phase, isSendingCode: $isSendingCode, isConfirming: $isConfirming, otpError: $otpError, passwordError: $passwordError, rePasswordError: $rePasswordError, emailError: $emailError)';
}


}

/// @nodoc
abstract mixin class _$ForgotPasswordStateCopyWith<$Res> implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$ForgotPasswordStateCopyWith(_ForgotPasswordState value, $Res Function(_ForgotPasswordState) _then) = __$ForgotPasswordStateCopyWithImpl;
@override @useResult
$Res call({
 ForgotPhase phase, bool isSendingCode, bool isConfirming, String? otpError, String? passwordError, String? rePasswordError, String? emailError
});




}
/// @nodoc
class __$ForgotPasswordStateCopyWithImpl<$Res>
    implements _$ForgotPasswordStateCopyWith<$Res> {
  __$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordState _self;
  final $Res Function(_ForgotPasswordState) _then;

/// Create a copy of ForgotPasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? isSendingCode = null,Object? isConfirming = null,Object? otpError = freezed,Object? passwordError = freezed,Object? rePasswordError = freezed,Object? emailError = freezed,}) {
  return _then(_ForgotPasswordState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as ForgotPhase,isSendingCode: null == isSendingCode ? _self.isSendingCode : isSendingCode // ignore: cast_nullable_to_non_nullable
as bool,isConfirming: null == isConfirming ? _self.isConfirming : isConfirming // ignore: cast_nullable_to_non_nullable
as bool,otpError: freezed == otpError ? _self.otpError : otpError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,rePasswordError: freezed == rePasswordError ? _self.rePasswordError : rePasswordError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
