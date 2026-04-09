
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../configs/themes/text_style.dart';
import '../../../flashcard/domain/daily_word_summary.dart';
import '../../../topic/presentation/controller/topic_flashcard_notifier.dart';

class QuizList extends StatelessWidget {
  const QuizList({
    super.key,
    required this.userDailyWordList,
    required this.topicList, required this.ref,
  });
  final List<DailyWordSummaryModel> userDailyWordList;
  final List<TopicModel> topicList;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Từ vựng hằng ngày', style: MyTextStyle.poppinsMedium700,),
            TextButton(
              onPressed: (){}, 
              child: Text('Tất cả', style: MyTextStyle.poppinsMedium600,),),
          ],
        ),
        SizedBox(
          height: 200.h,
          child: _dailyWordQuizList(context,userDailyWordList, color)
        ),

        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Từ vựng chủ đề', style: MyTextStyle.poppinsMedium700,),
            TextButton(
              onPressed: (){}, 
              child: Text('Tất cả', style: MyTextStyle.poppinsMedium600,),),
          ],
        ),
      ],
    );
  }

  Widget _dailyWordQuizList(
    BuildContext context,
    List<DailyWordSummaryModel> items,
    ColorScheme color,
  ) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          // padding: EdgeInsets.all(8.r),
          width: 125.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
          ),
          color: color.onPrimary,
          child: Column(
            spacing: 8.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                Format.formatDMY(item.assignedDate.toLocal()).isEmpty ? 'N/A'
                : Format.formatDMY(item.assignedDate.toLocal()),
                style: MyTextStyle.poppinsMedium600.copyWith(
                  color: color.primary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.topicName.isEmpty ? 'N/A' : item.topicName,
                  style: MyTextStyle.poppinsLarge600,),
                  Text(item.progress.isEmpty ? 'N/A': item.progress,
                  style: MyTextStyle.poppinsMedium600,),
                ],
              ),
              Text("Start", style: MyTextStyle.poppinsMedium700),
            ],
          ),
        );
      },
    );
  }

  Widget _topicQuizList(
    BuildContext context,
    List<TopicModel> items,
    ColorScheme color,
    
  ) {
    return ListView.builder(

      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final numWord = ref.watch(getFlashcardCountByTopicProvider(item.id));
        final wordCountText = numWord.when(
          data: (count) => '$count câu hỏi',
          loading: () => '... câu hỏi',
          error: (_, __) => 'N/A',
        );
        return Container(
          margin: EdgeInsets.symmetric(vertical: 16.h),
          // padding: EdgeInsets.all(8.r),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r),
          ),
          color: color.onPrimary,
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color.onPrimary,
                    ),
                    child: SvgPicture.asset(MyIcons.learn, colorFilter: ColorFilter.mode(color.primary, BlendMode.srcIn),)
                  ),
                  Column(
                    spacing: 8.h,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.name.isEmpty ? 'N/A' : item.name,
                        style: MyTextStyle.poppinsLarge600.copyWith(
                          color: color.primary,
                        ),
                      ),
                      Text(wordCountText,
                      style: MyTextStyle.poppinsMedium400.copyWith(color: color.outlineVariant),),
                     
                    ],
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: (){}, 
                child: Text('START'),
              )
            ],
          ),
        );
      },
    );
  }
}
