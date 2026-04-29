import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/themes/text_style.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({super.key, required this.msg, this.onPressed});
  final String msg;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg),
            SizedBox(height: 16.h),
            ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
              ),
              label: Text(
                'Thử lại',
                style: MyTextStyle.poppinsMedium600.copyWith(
                  color: color.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
