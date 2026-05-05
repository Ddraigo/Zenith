import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/utils/snackbar_helper.dart';
import '../controller/setting_notifier.dart';

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