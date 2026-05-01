import 'package:app_demo/src/features/profile/application/setting_service.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app_demo/src/shared/utils/validator.dart';
part 'setting_notifier.g.dart';

final pushNotificationProvider = StateProvider<bool>((ref) => false);
final darkModeProvider = StateProvider<bool>((ref) => false);

@riverpod
class SettingNotifier extends _$SettingNotifier {
  @override
  Future<void> build() async {
    try {
      ref.keepAlive();
    } catch (_) {}
  }

  Future<void> logout() async {
    await ref.read(settingServiceProvider).logout();
  }

  String? validateCurrentPassword(String value) {
    if (value.trim().isEmpty) {
      return 'Mật khẩu hiện tại không được để trống';
    }
    if (!Validator.isValidPassword(value)) {
      return 'Mật khẩu hiện tại không hợp lệ';
    }
    return null;
  }

  String? validateNewPassword({
    required String currentPassword,
    required String newPassword,
  }) {
    if (newPassword.trim().isEmpty) {
      return 'Mật khẩu mới không được để trống';
    }
    if (!Validator.isValidPassword(newPassword)) {
      return 'Mật khẩu mới không hợp lệ';
    }
    if (currentPassword.trim() == newPassword.trim()) {
      return 'Mật khẩu mới phải khác mật khẩu cũ';
    }
    return null;
  }

  String? validateConfirmPassword({
    required String newPassword,
    required String confirmPassword,
  }) {
    if (confirmPassword.trim().isEmpty) {
      return 'Vui lòng xác nhận mật khẩu';
    }
    if (newPassword.trim() != confirmPassword.trim()) {
      return 'Xác nhận mật khẩu không khớp';
    }
    return null;
  }

  bool isValidChangePasswordForm({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) {
    return validateCurrentPassword(currentPassword) == null &&
        validateNewPassword(
              currentPassword: currentPassword,
              newPassword: newPassword,
            ) ==
            null &&
        validateConfirmPassword(
              newPassword: newPassword,
              confirmPassword: confirmPassword,
            ) ==
            null;
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();
    try {
      await ref.read(settingServiceProvider).changePassword(
            currentPassword: currentPassword,
            newPassword: newPassword,
          );
      if (!ref.mounted) return;
      state = const AsyncData(null);
    } catch (e, st) {
      if (!ref.mounted) return;
      state = AsyncError(e, st);
      rethrow;
    }
  }
}
