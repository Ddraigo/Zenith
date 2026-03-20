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
    state = state.copyWith(userName: name, errorName: null);
  }

  void onEmailChange(String email) {
    state = state.copyWith(email: email, errorName: null);
  }

  void onPasswordChange(String password) {
    state = state.copyWith(password: password, errorPassword: null);
  }

  void onRePasswordChange(String rePassword) {
    state = state.copyWith(rePassword: rePassword, errorRePassword: null);
  }

  void validate() {
    String? errorName;
    String? errorEmail;
    String? errorPassword;
    String? errorRePassword;

    if (state.userName.isEmpty) {
      errorName = "Your user name is not empty";
    }
    if (!Validator.isValidEmail(state.email)) {
      errorEmail = "Email is not valid";
    }
    if (!Validator.isValidPassword(state.password)) {
      errorPassword = "Your password is not valid";
    }
    if (!Validator.isValidPassword(state.rePassword)) {
      errorRePassword = "Your password is not valid";
    }
    if (state.password.isNotEmpty &&
        state.rePassword.isNotEmpty &&
        state.password != state.rePassword) {
      errorRePassword = "Your password does not match";
    }
    state = state.copyWith(
        errorName: errorName,
        errorEmail: errorEmail,
        errorPassword: errorPassword,
        errorRePassword: errorRePassword);
  }

  late final AuthService _loginService = ref.read(authServiceProvider);

  Future<void> handleSignUp() async {
    validate();
    if (state.errorEmail != null ||
        state.errorName != null ||
        state.errorPassword != null ||
        state.errorRePassword != null) {
      return;
    }
    _loginService.signUp(state.userName, state.email, state.password);
    // call service
  }
}
