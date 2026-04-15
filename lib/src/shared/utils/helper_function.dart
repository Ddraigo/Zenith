import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter/material.dart';

class MyHelper{

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static String getErrorMessage(AppException exception) {
    return exception.when(
      connectivity: () => 'Lỗi kết nối mạng',
      unauthorized: () => 'Không có quyền truy cập',
      errorWithMessage: (msg) => msg,
      unknown: () => 'Lỗi không xác định',
      badRequest: (msg) => msg,
      server: (msg) => msg,
    );
  }
}