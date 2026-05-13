import 'package:app_demo/src/features/authentication/application/auth_service.dart';
import 'package:dart_either/dart_either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/validator.dart';
part 'forgot_pass_notifier.g.dart';
part 'forgot_pass_notifier.freezed.dart';


enum ForgotPhase {requestCode, confirmReset}

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState{

  const factory ForgotPasswordState({
  @Default(ForgotPhase.requestCode) ForgotPhase phase,
  @Default(false) bool isSendingCode,
  @Default(false) bool isConfirming,
   String? otpError,
   String? passwordError,
   String? rePasswordError,
   String? emailError,
  }) = _ForgotPasswordState;

  const ForgotPasswordState._();

  bool get isValidPhase1 => emailError == null;
  bool get isValidPhase2 =>
      otpError == null &&
      passwordError == null &&
      rePasswordError == null;

  factory ForgotPasswordState.initial() => const ForgotPasswordState();
  
} 

@riverpod
class ForgotPassNotifier extends _$ForgotPassNotifier {
  @override
  ForgotPasswordState build() => ForgotPasswordState.initial();

    String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'Email không được để trống';
    }
    if (!Validator.isValidEmail(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  String? validateOTP(String value){
    if(value.trim().isEmpty){
      return 'Mã xác nhận chưa có';
    }
    if(value.trim().length < 6){
      return 'Mã không hợp lệ';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Mật khẩu không được để trống';
    }
    if (!Validator.isValidPassword(value)) {
      return 'Mật khẩu phải từ 7 kí tự';
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


  Future<Either<AppException, bool>> sendOtp ({required String email})async{
    final emailError = validateEmail(email);
    if(emailError != null){
      state = state.copyWith(emailError: emailError);
      return Either.right(false);
    }

    state = state.copyWith(
      isSendingCode: true,
      emailError: null,
    );
    final result = await ref.read(authServiceProvider).sendOtpEmail(email: email);
    state = state.copyWith(isSendingCode: false);
    return result.fold(
      ifLeft: (e) => Either.left(e),
      ifRight: (_){
        state = state.copyWith(
          phase: ForgotPhase.confirmReset,
          otpError: null,
          passwordError: null,
          rePasswordError: null,
        );
        return Either.right(true);
      }
    );
  }

  

  Future<Either<AppException, bool>> confirmReset({
    required String email,
    required String otp,
    required String password,
    required String rePassword,
  })async{
    final otpError = validateOTP(otp);
    final passwordError = validatePassword(password);
    final rePasswordError = validateConfirmPassword(password, rePassword);
    final emailError = validateEmail(email);

    state = state.copyWith(
      emailError: emailError,
      otpError: otpError,
      passwordError: passwordError,
      rePasswordError: rePasswordError,
    );

    if (!state.isValidPhase2 || !state.isValidPhase1) {
      return Either.right(false);
    }

    state = state.copyWith(
      isConfirming: true,
      emailError: null,
    );

    final result = await ref.read(authServiceProvider).resetPassWithOtp(
      email: email.trim(), 
      otp: otp.trim(), 
      newPass: password
    );

    state = state.copyWith(isConfirming: false);
    return result.fold(
    ifLeft: (e) => Either.left(e),
    ifRight: (_) {
      state = ForgotPasswordState.initial();
      return Either.right(true);
    },
  );
  }

}