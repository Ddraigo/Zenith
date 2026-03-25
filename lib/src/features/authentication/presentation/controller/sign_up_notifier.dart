import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:app_demo/src/features/authentication/presentation/state/sign_up_state.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_up_notifier.g.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  SignUpState build() {
    return SignUpState();
  }

  void onUserNameChange(String name) {
    state = state.copyWith(userName: name, nameError: null, submitError: null);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email, emailError: null, submitError: null);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(
      password: password,
      passwordError: null,
      submitError: null,
    );
  }

  void onRePasswordChange(String rePassword) {
    state = state.copyWith(
      rePassword: rePassword,
      rePasswordError: null,
      submitError: null,
    );
  }

  void onDateChange(DateTime dayOfBirth) {
    state = state.copyWith(
      dayOfBirth: dayOfBirth,
      dayOfBirthError: null,
      submitError: null,
    );
  }

  void onGenderChange(Gender gender) {
    state = state.copyWith(
      gender: gender,
      genderError: null,
      submitError: null,
    );
  }

  String? _validateUsername(String value) {
    if (value.trim().isEmpty) {
      return 'Họ và tên không được để trống';
    }
    return null;
  }

  String? _validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    if (!Validator.isValidEmail(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }


  String? _validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (!Validator.isValidPassword(value)) {
      return 'Mật khẩu phải có hơn 4 kí tự';
    }
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (password != confirmPassword) {
      return 'Mật khẩu xác nhận chưa khớp';
    }
    return null;
  }

    String? _validDayOfBirth(DateTime? value){
    if(value == null) return 'Không được để trống';
    final now = DateTime.now();
    if(value.isAfter(now)) return 'Ngày sinh không thể là ngày tương lai';
    final age = now.year - value.year - 
          ((now.month < value.month ||
           ( now.month == value.month && now.day < value.day)) ? 1 : 0);
    if(age <= 3) return 'Phải trên 3 tuổi';
    return null;
  }

  void validateForm() {
    final nameError = _validateUsername(state.userName);
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);
    final rePasswordError = _validateConfirmPassword(
      state.password,
      state.rePassword,
    );
    final dayOfBirthError = _validDayOfBirth(state.dayOfBirth);

    state = state.copyWith(
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      rePasswordError: rePasswordError,
      dayOfBirthError: dayOfBirthError,
    );
  }

  late final AuthService _authService = ref.read(authServiceProvider);

  Future<void> handleSignUp() async {
    validateForm();
    if (state.emailError != null ||
        state.nameError != null ||
        state.passwordError != null ||
        state.rePasswordError != null ||
        state.genderError != null ||
        state.dayOfBirthError != null) {
      return;
    }
    final dob = state.dayOfBirth;
    if(dob == null) return;

    await _authService.signUp(
      state.userName,
      state.email,
      state.password,
      state.gender.name,
      state.dayOfBirth!,
    );
    // call service
  }
}
