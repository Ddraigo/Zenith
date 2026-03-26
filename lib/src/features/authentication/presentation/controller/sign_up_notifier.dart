import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_notifier.g.dart';

enum Gender { male, female, none }

class SignUpFormState {
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? rePasswordError;
  final String? genderError;
  final String? dayOfBirthError;

  SignUpFormState({
    this.nameError,
    this.emailError,
    this.passwordError,
    this.rePasswordError,
    this.genderError,
    this.dayOfBirthError,
  });

  bool get isValid =>
      nameError == null &&
      emailError == null &&
      passwordError == null &&
      rePasswordError == null &&
      dayOfBirthError == null;
}

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  FutureOr<void> build() {
    // No initialization needed
  }

  /// Validate username/full name
  String? validateUsername(String value) {
    if (value.trim().isEmpty) {
      return 'Họ và tên không được để trống';
    }
    return null;
  }

  /// Validate email
  String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    if (!Validator.isValidEmail(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  /// Validate password
  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (!Validator.isValidPassword(value)) {
      return 'Mật khẩu phải có hơn 4 kí tự';
    }
    return null;
  }

  /// Validate confirm password
  String? validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.trim().isEmpty) {
      return 'Mật khẩu xác nhận không được để trống';
    }
    if (password != confirmPassword) {
      return 'Mật khẩu xác nhận chưa khớp';
    }
    return null;
  }

  /// Validate date of birth
  String? validateDayOfBirth(DateTime? value) {
    if (value == null) return 'Không được để trống';
    final now = DateTime.now();
    if (value.isAfter(now)) return 'Ngày sinh không thể là ngày tương lai';
    final age =
        now.year -
        value.year -
        ((now.month < value.month ||
                (now.month == value.month && now.day < value.day))
            ? 1
            : 0);
    if (age <= 3) return 'Phải trên 3 tuổi';
    return null;
  }

  SignUpFormState validateForm({
    required String userName,
    required String email,
    required String password,
    required String rePassword,
    required DateTime? dayOfBirth,
  }) {
    return SignUpFormState(
      nameError: validateUsername(userName),
      emailError: validateEmail(email),
      passwordError: validatePassword(password),
      rePasswordError: validateConfirmPassword(password, rePassword),
      dayOfBirthError: validateDayOfBirth(dayOfBirth),
    );
  }

  Future<void> handleSignUp({
    required String userName,
    required String email,
    required String password,
    required String rePassword,
    required Gender? gender,
    required DateTime? dayOfBirth,
  }) async {
    // 1. Validate all fields
    final formState = validateForm(
      userName: userName,
      email: email,
      password: password,
      rePassword: rePassword,
      dayOfBirth: dayOfBirth,
    );

    if (!formState.isValid) {
      return;
    }

    // 2. Set loading state
    state = const AsyncLoading();

    // 3. Call service and handle result
    state = await AsyncValue.guard(
      () async {
        final genderToSave =
            gender == Gender.none ? '' : gender?.name;

        await ref.read(authServiceProvider).signUp(
          userName: userName.trim(),
          email: email.trim(),
          password: password,
          dayOfBirth: dayOfBirth!,
          gender: genderToSave!,
        );
      },
    );
  }
}

