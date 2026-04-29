import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter/material.dart';

class MyHelper {
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String getErrorMessage(AppException exception) {
    return exception.when(
      connectivity: () =>
          'Không có kết nối internet.\nVui lòng kiểm tra kết nối.',
      unauthorized: () => 'Phiên đã hết hạn.\nVui lòng đăng nhập lại.',
      errorWithMessage: (message) => message,
      unknown: () => 'Đã xảy ra lỗi.\nVui lòng thử lại sau.',
      badRequest: (message) => 'Lỗi: $message',
      server: (message) => 'Lỗi máy chủ: $message',
      permissionDenied: (message) => 'Không có quyền: $message',
    );
  }

  static IconData toIconData(AppException exception) {
    return exception.when(
      connectivity: () => Icons.wifi_off,
      unauthorized: () => Icons.lock_outline,
      errorWithMessage: (_) => Icons.error_outline,
      unknown: () => Icons.warning_outlined,
      badRequest: (_) => Icons.error_outline,
      server: (_) => Icons.cloud_off,
      permissionDenied: (_) => Icons.block,
    );
  }

  static Color toColor(AppException exception) {
    return exception.when(
      connectivity: () => Colors.orange,
      unauthorized: () => Colors.red,
      errorWithMessage: (_) => Colors.red,
      unknown: () => Colors.orange,
      badRequest: (_) => Colors.red,
      server: (_) => Colors.red,
      permissionDenied: (_) => Colors.red,
    );
  }

  static bool sameDate(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
