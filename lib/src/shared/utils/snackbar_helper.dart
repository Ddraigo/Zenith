import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarHelper{
  static void showError(
    BuildContext context,
    AppException exception, {
      Duration duration = const Duration(seconds: 3),
      SnackBarAction? action,
    }
  ){
    final msg = MyHelper.getErrorMessage(exception);
    final icon = MyHelper.toIconData(exception);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Row(children: [
        Icon(icon, color: Colors.white,),
        SizedBox(width: 12.w),
        Expanded(child: Text(msg)),
      ],),
      duration: duration,
      backgroundColor: Colors.red.shade400,
      action: action,
      margin: EdgeInsets.all(16.r),
      behavior: SnackBarBehavior.floating,
      ),
    
    );
  }

  static void showSuccess(
    BuildContext context,
    String msg,{
      Duration duration = const Duration(seconds: 3)
    }
  ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Row(
        children: [
          Icon(Icons.check_circle),
          SizedBox(width: 12.w),
          Expanded(child: Text(msg)),
        ],
      ),
      duration: duration,
      backgroundColor: Colors.green.shade400,
      margin: EdgeInsets.all(16.r),
      behavior: SnackBarBehavior.floating,

      ),
    );
  }

  static void showWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.warning_outlined, color: Colors.white),
            SizedBox(width: 12.w),
            Expanded(child: Text(message)),
          ],
        ),
        duration: duration,
        backgroundColor: Colors.orange.shade500,
        margin: EdgeInsets.all(16.r),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showInfo(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.info_outlined, color: Colors.white),
            SizedBox(width: 12.w),
            Expanded(child: Text(message)),
          ],
        ),
        duration: duration,
        backgroundColor: Colors.blue.shade500,
        margin: EdgeInsets.all(16.r),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}