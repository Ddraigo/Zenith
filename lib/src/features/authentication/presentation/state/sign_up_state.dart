import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

enum Gender {male, female, none}

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default('') String email,
    @Default('') String userName,
    @Default('') String password,
    @Default('') String rePassword,
    @Default(Gender.none) Gender gender,
    DateTime? dayOfBirth,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? rePasswordError,
    String? genderError,
    String? dayOfBirthError,
    String? submitError,
    @Default(false) bool isSubmitting,
    @Default(false) bool submittingError,
    
  }) = _SignUpSate;
}
