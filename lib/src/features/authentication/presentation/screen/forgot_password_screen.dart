import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/authentication/presentation/controller/forgot_pass_notifier.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/utils/snackbar_helper.dart';
import 'package:app_demo/src/shared/widgets/button_custom.dart';
import 'package:app_demo/src/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _verifyOtpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _emailAddressNode = FocusNode();
  final _verifyOtpFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _rePasswordFocusNode = FocusNode();

  bool _hidePassword = true;
  bool _hideConfirm = true;

  @override
  void dispose() {
    _clearForm();
    super.dispose();
  }

  void _clearForm() {
    _emailAddressController.clear();
    _verifyOtpController.clear();
    _passwordController.clear();
    _rePasswordController.clear();
    _emailAddressNode.unfocus();
    _verifyOtpFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _rePasswordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final formState = ref.watch(forgotPassProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        // maintainBottomViewPadding: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) { 
              return SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: _buildFormResetPass(formState, colorScheme),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFormResetPass(ForgotPasswordState formState, ColorScheme color) {
    final notifier = ref.read(forgotPassProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [
          if (formState.phase == ForgotPhase.requestCode) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Bạn quên mật khẩu?',
                  style: MyTextStyle.poppinsHeading2.copyWith(
                    color: color.primary.withValues(alpha: 0.7),
                  ),
                ),
      
                Text(
                  'Không sao, nhập email vào đây rồi check gmail để nhận mã nha!',
                  style: MyTextStyle.poppinsMedium,
                ),
                SizedBox(height: 16.h),
                TextFieldCustom(
                  icon: MyIcons.emailIcon,
                  hintText: 'Nhập email',
                  focusNode: _emailAddressNode,
                  controller: _emailAddressController,
                  errorText: formState.emailError,
                ),
                SizedBox(height: 16.h),
              ],
            ),
            const Spacer(),
            ButtonCustom(
              onPressed: formState.isSendingCode
                  ? null
                  : () async {
                      final result = await notifier.sendOtp(
                        email: _emailAddressController.text.trim(),
                      );
                      result.fold(
                        ifLeft: (e) => SnackBarHelper.showError(context, e),
                        ifRight: (success) {
                          if (success) {
                            _verifyOtpFocusNode.requestFocus();
                          }
                        },
                      );
                    },
              type: ButtonType.elevated,
              label: formState.isSendingCode ? 'Đang gửi...' : 'Gửi mã OTP',
              minimumSize: Size(double.maxFinite, 55.h),
            ),
          ],
          if (formState.phase == ForgotPhase.confirmReset) ...[
            Text(
                  'Xác nhận',
                  style: MyTextStyle.poppinsHeading2.copyWith(
                    color: color.primary.withValues(alpha: 0.7),
                  ),
                ),
      
                Text(
                  'Bước cuối cùng rồi, nhớ kiểm tra mã OTP thật kỹ nha',
                  style: MyTextStyle.poppinsMedium,
                ),
                SizedBox(height: 16.h,),
            TextFieldCustom(
              icon: MyIcons.otp,
              hintText: 'Nhập mã xác nhận',
              focusNode: _verifyOtpFocusNode,
              controller: _verifyOtpController,
              errorText: formState.otpError,
              suffixIcon: TextButton(
                onPressed: formState.isSendingCode
                    ? null
                    : () async {
                        final result = await notifier.sendOtp(
                          email: _emailAddressController.text.trim(),
                        );
                        result.fold(
                          ifLeft: (e) => SnackBarHelper.showError(context, e),
                          ifRight: (success) {
                            if (success) {
                              _verifyOtpFocusNode.requestFocus();
                            }
                          },
                        );
                      },
                child: Text(
                  formState.isSendingCode ? 'Đang gửi...' : 'Gửi lại mã',
                  style: MyTextStyle.poppinsMedium.copyWith(color: color.primary),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextFieldCustom(
              icon: MyIcons.changePassword,
              hintText: 'Mật khẩu mới',
              focusNode: _passwordFocusNode,
              obscureText: _hidePassword,
              controller: _passwordController,
              errorText: formState.passwordError,
              suffixIcon: IconButton(
                onPressed: () => setState(() => _hidePassword = !_hidePassword),
                icon: Icon(
                  _hidePassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextFieldCustom(
              icon: MyIcons.changePassword,
              hintText: 'Xác nhận lại mật khẩu',
              focusNode: _rePasswordFocusNode,
              obscureText: _hideConfirm,
              controller: _rePasswordController,
              errorText: formState.rePasswordError,
              suffixIcon: IconButton(
                onPressed: () => setState(() => _hideConfirm = !_hideConfirm),
                icon: Icon(
                  _hideConfirm ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Spacer(),
            ButtonCustom(
              onPressed: formState.isConfirming
                  ? null
                  : () async {
                      final result = await notifier.confirmReset(
                        email: _emailAddressController.text.trim(),
                        otp: _verifyOtpController.text.trim(),
                        password: _passwordController.text.trim(),
                        rePassword: _rePasswordController.text.trim(),
                      );
                      result.fold(
                        ifLeft: (e) => SnackBarHelper.showError(context, e),
                        ifRight: (success) {
                          if (success) {
                            SnackBarHelper.showSuccess(
                              context,
                              'Đổi mật khẩu thành công',
                            );
                            context.go(AppRouter.loginPath);
                          }
                        },
                      );
                    },
              type: ButtonType.elevated,
              label: formState.isConfirming ? 'Đang xử lý...' : 'Xác nhận',
              minimumSize: Size(double.infinity, 55.h),
            ),
          ],
        ],
      ),
    );
  }
}
