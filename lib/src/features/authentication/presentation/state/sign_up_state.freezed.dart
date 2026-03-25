// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState {

 String get email; String get userName; String get password; String get rePassword; Gender get gender; DateTime? get dayOfBirth; String? get nameError; String? get emailError; String? get passwordError; String? get rePasswordError; String? get genderError; String? get dayOfBirthError; String? get submitError; bool get isSubmitting; bool get submittingError;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.email, email) || other.email == email)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.password, password) || other.password == password)&&(identical(other.rePassword, rePassword) || other.rePassword == rePassword)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dayOfBirth, dayOfBirth) || other.dayOfBirth == dayOfBirth)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.rePasswordError, rePasswordError) || other.rePasswordError == rePasswordError)&&(identical(other.genderError, genderError) || other.genderError == genderError)&&(identical(other.dayOfBirthError, dayOfBirthError) || other.dayOfBirthError == dayOfBirthError)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submittingError, submittingError) || other.submittingError == submittingError));
}


@override
int get hashCode => Object.hash(runtimeType,email,userName,password,rePassword,gender,dayOfBirth,nameError,emailError,passwordError,rePasswordError,genderError,dayOfBirthError,submitError,isSubmitting,submittingError);

@override
String toString() {
  return 'SignUpState(email: $email, userName: $userName, password: $password, rePassword: $rePassword, gender: $gender, dayOfBirth: $dayOfBirth, nameError: $nameError, emailError: $emailError, passwordError: $passwordError, rePasswordError: $rePasswordError, genderError: $genderError, dayOfBirthError: $dayOfBirthError, submitError: $submitError, isSubmitting: $isSubmitting, submittingError: $submittingError)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 String email, String userName, String password, String rePassword, Gender gender, DateTime? dayOfBirth, String? nameError, String? emailError, String? passwordError, String? rePasswordError, String? genderError, String? dayOfBirthError, String? submitError, bool isSubmitting, bool submittingError
});




}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? userName = null,Object? password = null,Object? rePassword = null,Object? gender = null,Object? dayOfBirth = freezed,Object? nameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? rePasswordError = freezed,Object? genderError = freezed,Object? dayOfBirthError = freezed,Object? submitError = freezed,Object? isSubmitting = null,Object? submittingError = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rePassword: null == rePassword ? _self.rePassword : rePassword // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dayOfBirth: freezed == dayOfBirth ? _self.dayOfBirth : dayOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,rePasswordError: freezed == rePasswordError ? _self.rePasswordError : rePasswordError // ignore: cast_nullable_to_non_nullable
as String?,genderError: freezed == genderError ? _self.genderError : genderError // ignore: cast_nullable_to_non_nullable
as String?,dayOfBirthError: freezed == dayOfBirthError ? _self.dayOfBirthError : dayOfBirthError // ignore: cast_nullable_to_non_nullable
as String?,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submittingError: null == submittingError ? _self.submittingError : submittingError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns on SignUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpSate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpSate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpSate value)  $default,){
final _that = this;
switch (_that) {
case _SignUpSate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpSate value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpSate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String userName,  String password,  String rePassword,  Gender gender,  DateTime? dayOfBirth,  String? nameError,  String? emailError,  String? passwordError,  String? rePasswordError,  String? genderError,  String? dayOfBirthError,  String? submitError,  bool isSubmitting,  bool submittingError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpSate() when $default != null:
return $default(_that.email,_that.userName,_that.password,_that.rePassword,_that.gender,_that.dayOfBirth,_that.nameError,_that.emailError,_that.passwordError,_that.rePasswordError,_that.genderError,_that.dayOfBirthError,_that.submitError,_that.isSubmitting,_that.submittingError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String userName,  String password,  String rePassword,  Gender gender,  DateTime? dayOfBirth,  String? nameError,  String? emailError,  String? passwordError,  String? rePasswordError,  String? genderError,  String? dayOfBirthError,  String? submitError,  bool isSubmitting,  bool submittingError)  $default,) {final _that = this;
switch (_that) {
case _SignUpSate():
return $default(_that.email,_that.userName,_that.password,_that.rePassword,_that.gender,_that.dayOfBirth,_that.nameError,_that.emailError,_that.passwordError,_that.rePasswordError,_that.genderError,_that.dayOfBirthError,_that.submitError,_that.isSubmitting,_that.submittingError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String userName,  String password,  String rePassword,  Gender gender,  DateTime? dayOfBirth,  String? nameError,  String? emailError,  String? passwordError,  String? rePasswordError,  String? genderError,  String? dayOfBirthError,  String? submitError,  bool isSubmitting,  bool submittingError)?  $default,) {final _that = this;
switch (_that) {
case _SignUpSate() when $default != null:
return $default(_that.email,_that.userName,_that.password,_that.rePassword,_that.gender,_that.dayOfBirth,_that.nameError,_that.emailError,_that.passwordError,_that.rePasswordError,_that.genderError,_that.dayOfBirthError,_that.submitError,_that.isSubmitting,_that.submittingError);case _:
  return null;

}
}

}

/// @nodoc


class _SignUpSate implements SignUpState {
  const _SignUpSate({this.email = '', this.userName = '', this.password = '', this.rePassword = '', this.gender = Gender.none, this.dayOfBirth, this.nameError, this.emailError, this.passwordError, this.rePasswordError, this.genderError, this.dayOfBirthError, this.submitError, this.isSubmitting = false, this.submittingError = false});
  

@override@JsonKey() final  String email;
@override@JsonKey() final  String userName;
@override@JsonKey() final  String password;
@override@JsonKey() final  String rePassword;
@override@JsonKey() final  Gender gender;
@override final  DateTime? dayOfBirth;
@override final  String? nameError;
@override final  String? emailError;
@override final  String? passwordError;
@override final  String? rePasswordError;
@override final  String? genderError;
@override final  String? dayOfBirthError;
@override final  String? submitError;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool submittingError;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpSateCopyWith<_SignUpSate> get copyWith => __$SignUpSateCopyWithImpl<_SignUpSate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpSate&&(identical(other.email, email) || other.email == email)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.password, password) || other.password == password)&&(identical(other.rePassword, rePassword) || other.rePassword == rePassword)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dayOfBirth, dayOfBirth) || other.dayOfBirth == dayOfBirth)&&(identical(other.nameError, nameError) || other.nameError == nameError)&&(identical(other.emailError, emailError) || other.emailError == emailError)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.rePasswordError, rePasswordError) || other.rePasswordError == rePasswordError)&&(identical(other.genderError, genderError) || other.genderError == genderError)&&(identical(other.dayOfBirthError, dayOfBirthError) || other.dayOfBirthError == dayOfBirthError)&&(identical(other.submitError, submitError) || other.submitError == submitError)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.submittingError, submittingError) || other.submittingError == submittingError));
}


@override
int get hashCode => Object.hash(runtimeType,email,userName,password,rePassword,gender,dayOfBirth,nameError,emailError,passwordError,rePasswordError,genderError,dayOfBirthError,submitError,isSubmitting,submittingError);

@override
String toString() {
  return 'SignUpState(email: $email, userName: $userName, password: $password, rePassword: $rePassword, gender: $gender, dayOfBirth: $dayOfBirth, nameError: $nameError, emailError: $emailError, passwordError: $passwordError, rePasswordError: $rePasswordError, genderError: $genderError, dayOfBirthError: $dayOfBirthError, submitError: $submitError, isSubmitting: $isSubmitting, submittingError: $submittingError)';
}


}

/// @nodoc
abstract mixin class _$SignUpSateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpSateCopyWith(_SignUpSate value, $Res Function(_SignUpSate) _then) = __$SignUpSateCopyWithImpl;
@override @useResult
$Res call({
 String email, String userName, String password, String rePassword, Gender gender, DateTime? dayOfBirth, String? nameError, String? emailError, String? passwordError, String? rePasswordError, String? genderError, String? dayOfBirthError, String? submitError, bool isSubmitting, bool submittingError
});




}
/// @nodoc
class __$SignUpSateCopyWithImpl<$Res>
    implements _$SignUpSateCopyWith<$Res> {
  __$SignUpSateCopyWithImpl(this._self, this._then);

  final _SignUpSate _self;
  final $Res Function(_SignUpSate) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? userName = null,Object? password = null,Object? rePassword = null,Object? gender = null,Object? dayOfBirth = freezed,Object? nameError = freezed,Object? emailError = freezed,Object? passwordError = freezed,Object? rePasswordError = freezed,Object? genderError = freezed,Object? dayOfBirthError = freezed,Object? submitError = freezed,Object? isSubmitting = null,Object? submittingError = null,}) {
  return _then(_SignUpSate(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,rePassword: null == rePassword ? _self.rePassword : rePassword // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,dayOfBirth: freezed == dayOfBirth ? _self.dayOfBirth : dayOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,nameError: freezed == nameError ? _self.nameError : nameError // ignore: cast_nullable_to_non_nullable
as String?,emailError: freezed == emailError ? _self.emailError : emailError // ignore: cast_nullable_to_non_nullable
as String?,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,rePasswordError: freezed == rePasswordError ? _self.rePasswordError : rePasswordError // ignore: cast_nullable_to_non_nullable
as String?,genderError: freezed == genderError ? _self.genderError : genderError // ignore: cast_nullable_to_non_nullable
as String?,dayOfBirthError: freezed == dayOfBirthError ? _self.dayOfBirthError : dayOfBirthError // ignore: cast_nullable_to_non_nullable
as String?,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,submittingError: null == submittingError ? _self.submittingError : submittingError // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
