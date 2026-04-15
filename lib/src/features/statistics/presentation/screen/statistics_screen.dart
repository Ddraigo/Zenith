import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatisticsScreen extends ConsumerStatefulWidget {
  const StatisticsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: color.onPrimary,
                  borderRadius: BorderRadius.circular(32.r),
                  gradient: RadialGradient(
                      center: Alignment.center, // Tâm loang màu ở giữa
                      radius: 0.7,              // Độ rộng của vùng loang
                      colors: [
                        Colors.amber.shade50, // Màu ở tâm (nhạt và trong suốt)
                        color.onPrimary,                      // Mờ dần về phía cạnh
                      ],
                      stops: const [0.0, 1.0], // 0.0 là tại tâm, 1.0 là tại rìa radius
                    ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 4.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Chuỗi hiện tại',
                      style: MyTextStyle.poppinsLarge600.copyWith(
                        color: color.primary,
                        fontSize: 22.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 5.w,
                      children: [
                        Text('5', style: MyTextStyle.poppinsHeading2),
                        SvgPicture.asset(
                          MyIcons.streak,
                          height: 40.h,
                          width: 40.w,
                        ),
                      ],
                    ),
                    Text(
                      'Day streak',
                      style: MyTextStyle.poppinsLarge.copyWith(
                        color: color.outline.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
