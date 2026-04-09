import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/controller/shared_flashcard_notifier.dart';
import '../../../../shared/widgets/button_custom.dart';



class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    
    final dailyWordAsync = ref.watch(getDailyAllTopicsGroupedProvider);
    final topicListAsync = ref.watch(getTopicListProvider);

    return Container(
      padding: EdgeInsets.all(32.h),
      child: Column(
        children: [
          _dailyProgress(color),

        ],
      ),
    );
  }

  Widget _dailyProgress(ColorScheme color){
    return Container(
        padding: EdgeInsets.all(32.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48.r),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              color.primaryContainer,
              color.onPrimary,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.005),
              blurRadius: 20,
              offset: Offset(0, 10)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chinh phục 10 từ hôm nay",
              style: MyTextStyle.poppinsHeading1,
            ),
            Text(
              "Làm quiz ngay để giữ chuỗi 12 ngày học hành siêng năng nhé!",
              style: MyTextStyle.poppinsLarge400.copyWith(color: color.secondary),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 10.h,
                    borderRadius: BorderRadius.circular(10.r),
                    backgroundColor: color.outline.withOpacity(0.4),
                    value: 4/10,
                    valueColor: AlwaysStoppedAnimation<Color>(color.primary),
                  ),
                ),
                SizedBox(width: 16.w,),
                ButtonCustom(
                  type: ButtonType.text, 
                  onPressed: (){},
                  minimumSize: Size(90.w, 50.h),
                  borderRadius: 10.r,
                  label: 'Bắt đầu',
                ),
                
              ],
            )
          ],
        ),
    );
  }

}