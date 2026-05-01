import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/profile/presentation/controller/setting_notifier.dart';
import 'package:app_demo/src/shared/utils/logout_utils.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/utils/helper_function.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/switch_button.dart';

class SettingSreen extends ConsumerWidget {
  const SettingSreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    // final notificationStatus = ref.watch(pushNotificationProvider);
    // final darkModeStatus = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black26,
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        centerTitle: true,
        title: Text('Cài đặt'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () {
              ref.read(settingProvider.notifier).logout();
              if (context.mounted) {
                invalidateUserSessionProviders(ref);
                context.go(AppRouter.loginPath);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: color.onPrimary,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            ),
            child: Row(
              spacing: 10.w,
              children: [
                SvgPicture.asset(MyIcons.logout, width: 40.w, height: 40.h),
                Expanded(
                  child: Text(
                    'Đăng xuất',
                    style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // _buttonAction(
      //     onPressed: (){
      //       ref.read(settingProvider.notifier).logout();
      //       if(context.mounted){
      //         ref.invalidate(currentUserIdProvider);
      //         context.go(AppRouter.loginPath);
      //       }
      //     },
      //     color: color,
      //     label: 'Đăng xuất',
      //     iconPath: MyIcons.logout,
      //   ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Column(
            spacing: 8.h,
            children: [
              _account(color, ref, context),
              SizedBox(height: 8.h),
              // _general(
              //   color: color,
              //   ref: ref,
              //   notificationStatus: notificationStatus,
              //   darkModeStatus: darkModeStatus,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _account(ColorScheme color, WidgetRef ref, BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tài khoản',
          style: MyTextStyle.poppinsLarge400.copyWith(
            color: color.outline.withValues(alpha: 0.8),
          ),
        ),

        _buttonAction(
          onPressed: () => _showChangePasswordDialog(context, ref, color),
          color: color,
          label: 'Đổi mật khẩu',
          iconPath: MyIcons.changePassword,
        ),
      ],
    );
  }

  Widget _general({
    required ColorScheme color,
    required WidgetRef ref,
    required bool notificationStatus,
    required bool darkModeStatus,
  }) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cài đặt chung',
          style: MyTextStyle.poppinsLarge400.copyWith(
            color: color.outline.withValues(alpha: 0.8),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: color.onPrimary,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Thông báo',
                  style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                ),
              ),
              SwitchButton(
                value: notificationStatus,
                onChanged: (newValue) {
                  ref.read(pushNotificationProvider.notifier).state = newValue;
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: color.onPrimary,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Chế độ',
                  style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                ),
              ),
              SwitchButton(
                value: darkModeStatus,

                onChanged: (newValue) {
                  ref.read(darkModeProvider.notifier).state = newValue;
                },
                iconOn: Icons.dark_mode_outlined,
                iconOff: Icons.light_mode_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonAction({
    required ColorScheme color,
    required String label,
    required String iconPath,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.onPrimary,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          SvgPicture.asset(iconPath, width: 40.w, height: 40.h),
          Expanded(
            child: Text(
              label,
              style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: color.secondary,
            size: 20,
          ),
        ],
      ),
    );
  }

  Future<void> _showChangePasswordDialog(
    BuildContext context,
    WidgetRef ref,
    ColorScheme color,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => ChangePasswordDialog(
        parentContext: context,
        color: color,
      ),
    );
  }
}

class ChangePasswordDialog extends ConsumerStatefulWidget {
  final BuildContext parentContext;
  final ColorScheme color;

  const ChangePasswordDialog({
    required this.parentContext,
    required this.color,
    super.key,
  });

  @override
  ConsumerState<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog> {
  late final TextEditingController currentController;
  late final TextEditingController newController;
  late final TextEditingController confirmController;

  bool hideCurrent = true;
  bool hideNew = true;
  bool hideConfirm = true;
  bool isSubmitting = false;
  String? errorText;

  @override
  void initState() {
    super.initState();
    currentController = TextEditingController();
    newController = TextEditingController();
    confirmController = TextEditingController();
  }

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> handleSubmit() async {
    final current = currentController.text.trim();
    final next = newController.text.trim();
    final confirm = confirmController.text.trim();
    final notifier = ref.read(settingProvider.notifier);

    final currentError = notifier.validateCurrentPassword(current);
    if (currentError != null) {
      if (!mounted) return;
      setState(() => errorText = currentError);
      return;
    }

    final newError = notifier.validateNewPassword(
      currentPassword: current,
      newPassword: next,
    );
    if (newError != null) {
      if (!mounted) return;
      setState(() => errorText = newError);
      return;
    }

    final confirmError = notifier.validateConfirmPassword(
      newPassword: next,
      confirmPassword: confirm,
    );
    if (confirmError != null) {
      if (!mounted) return;
      setState(() => errorText = confirmError);
      return;
    }

    if (!mounted) return;
    setState(() {
      errorText = null;
      isSubmitting = true;
    });

    try {
      await notifier.changePassword(
        currentPassword: current,
        newPassword: next,
      );

      if (!mounted) return;
      Navigator.of(context).pop();
      SnackBarHelper.showSuccess(widget.parentContext, 'Đổi mật khẩu thành công');
    } on AppException catch (e) {
      if (!mounted) return;
      String userMsg = MyHelper.getErrorMessage(e);
      e.maybeWhen(
        badRequest: (msg) {
          if (msg.toLowerCase().contains('email') ||
              msg.toLowerCase().contains('mật khẩu') ||
              msg.toLowerCase().contains('không đúng')) {
            userMsg = 'Mật khẩu hiện tại không đúng';
          } else {
            userMsg = MyHelper.getErrorMessage(e);
          }
        },
        orElse: () => userMsg = MyHelper.getErrorMessage(e),
      );

      setState(() => errorText = userMsg);
    } catch (_) {
      if (!mounted) return;
      setState(() => errorText = 'Đổi mật khẩu thất bại');
    } finally {
      if (!mounted) return;
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color;

    return AlertDialog(
      contentPadding: EdgeInsets.all(16.r),
      backgroundColor: color.onPrimary,
      actionsPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      title: const Text('Đổi mật khẩu'),
      content: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            controller: currentController,
            obscureText: hideCurrent,
            decoration: InputDecoration(
              labelText: 'Mật khẩu hiện tại',
              suffixIcon: IconButton(
                onPressed: () => setState(() => hideCurrent = !hideCurrent),
                icon: Icon(hideCurrent ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: newController,
            obscureText: hideNew,
            decoration: InputDecoration(
              labelText: 'Mật khẩu mới',
              suffixIcon: IconButton(
                onPressed: () => setState(() => hideNew = !hideNew),
                icon: Icon(hideNew ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          TextField(
            controller: confirmController,
            obscureText: hideConfirm,
            decoration: InputDecoration(
              labelText: 'Xác nhận mật khẩu',
              suffixIcon: IconButton(
                onPressed: () => setState(() => hideConfirm = !hideConfirm),
                icon: Icon(hideConfirm ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          if (errorText != null) ...[
            SizedBox(height: 12.h),
            Text(
              errorText!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ]),
      ),
      actions: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 5.h)),
          onPressed: isSubmitting ? null : () => Navigator.of(context).pop(),
          child: const Text('Hủy'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 5.h)),
          onPressed: isSubmitting ? null : handleSubmit,
          child: isSubmitting
              ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Lưu'),
        ),
      ],
    );
  }
}
