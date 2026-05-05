import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/src/core/domain/quiz_attempt_args.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:app_demo/src/shared/widgets/bottom_sheet_list_item.dart';

import '../../../../../configs/themes/text_style.dart';
import '../../../flashcard/domain/daily_word_summary.dart';
import '../../../../core/provider/shared_flashcard_notifier.dart';
import '../../../topic/presentation/controller/topic_flashcard_notifier.dart';

class QuizList extends StatelessWidget {
  const QuizList({
    super.key,
    required this.userDailyWordList,
    required this.topicList,
    required this.ref,
  });
  final List<DailyWordSummaryModel> userDailyWordList;
  final List<TopicModel> topicList;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final allDailyAsync = ref.watch(getDailyAllTopicsGroupedProvider);
    return Column(
      children: [
        if (userDailyWordList.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Từ vựng hằng ngày',
                  style: MyTextStyle.poppinsMedium.copyWith(fontSize: 17.sp),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => BottomSheetListItem(
                        title: 'Từ vựng hằng ngày',
                        builder: (scrollController) =>
                            _buildAllDailyListSheet(
                          context,
                          allDailyAsync,
                          color,
                          scrollController,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Tất cả',
                    style: MyTextStyle.poppinsMedium.copyWith(fontSize: 17.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150.h,
            child: _dailyWordQuizList(context, userDailyWordList, color),
          ),
          SizedBox(height: 16.h),
        ],
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Từ vựng chủ đề',
                      style: MyTextStyle.poppinsMedium.copyWith(fontSize: 17.sp),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Tất cả',
                  //     style: MyTextStyle.poppinsMedium.copyWith(
                  //       fontSize: 17.sp,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              _topicQuizList(context, topicList, color),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dailyWordQuizList(
    BuildContext context,
    List<DailyWordSummaryModel> items,
    ColorScheme color,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return GestureDetector(
            onTap: () {
              final args = QuizAttemptArgs(
                type: QuizAttemptType.daily,
                topicId: item.topicId,
                title: item.topicName,
                assignedDate: item.assignedDate,
              );

              context.push(AppRouter.quizAttempPath, extra: args);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
              padding: EdgeInsets.all(10.r),
              width: 140.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: color.outline.withValues(alpha: 0.06),
                border: Border.all(
                  color: color.outlineVariant.withValues(alpha: 0.5),
                ),
              ),

              child: Column(
                spacing: 2.h,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.topicName.isEmpty ? 'N/A' : item.topicName,
                    style: MyTextStyle.poppinsLarge600.copyWith(
                      fontSize: 20.sp,
                      color: color.onPrimaryFixedVariant.withValues(alpha: 0.7),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    Format.formatDMY(item.assignedDate).isEmpty
                        ? 'N/A'
                        : Format.formatDMY(item.assignedDate),
                    style: MyTextStyle.poppinsMedium.copyWith(
                      color: color.primary,
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _dailyWordFullList(
    BuildContext context,
    List<DailyWordSummaryModel> items,
    ColorScheme color,
    ScrollController scrollController,
  ) {
    return ListView.builder(
      controller: scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: color.outline.withValues(alpha: 0.06),
            border: Border.all(
              color: color.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16.r),
            onTap: () {
              final args = QuizAttemptArgs(
                type: QuizAttemptType.daily,
                topicId: item.topicId,
                title: item.topicName,
                assignedDate: item.assignedDate,
              );
              Navigator.of(context).pop();
              context.push(AppRouter.quizAttempPath, extra: args);
            },
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.secondaryContainer.withValues(alpha: 0.8),
                  ),
                  child: SvgPicture.asset(
                    MyIcons.learn,
                    colorFilter: ColorFilter.mode(
                      color.primary,
                      BlendMode.srcIn,
                    ),
                    height: 28.h,
                    width: 28.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.topicName.isEmpty ? 'N/A' : item.topicName,
                        style: MyTextStyle.poppinsLarge600.copyWith(
                          fontSize: 18.sp,
                          color: color.onPrimaryFixedVariant
                              .withValues(alpha: 0.7),
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        Format.formatDMY(item.assignedDate).isEmpty
                            ? 'N/A'
                            : Format.formatDMY(item.assignedDate),
                        style: MyTextStyle.poppinsMedium.copyWith(
                          color: color.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: color.outline.withValues(alpha: 0.6),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAllDailyListSheet(
    BuildContext context,
    AsyncValue<Map<DateTime, List<DailyWordSummaryModel>>> allDailyAsync,
    ColorScheme color,
    ScrollController scrollController,
  ) {
    return allDailyAsync.when(
      data: (dailyWords) {
        final items = dailyWords.values.expand((e) => e).toList();
        if (items.isEmpty) {
          return Center(
            child: Text(
              'Chưa có dữ liệu',
              style: MyTextStyle.poppinsMedium,
            ),
          );
        }
        return _dailyWordFullList(context, items, color, scrollController);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text(
          'Đã xảy ra lỗi',
          style: MyTextStyle.poppinsMedium,
        ),
      ),
    );
  }

  Widget _topicQuizList(
    BuildContext context,
    List<TopicModel> items,
    ColorScheme color,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final numWord = ref.watch(getFlashcardCountByTopicProvider(item.id));
        final wordCountText = numWord.when(
          data: (count) => '$count câu hỏi',
          loading: () => '... câu hỏi',
          error: (_, _) => 'N/A',
        );
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.all(16.r),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r),
            color: color.outline.withValues(alpha: 0.06),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  spacing: 16.h,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.secondaryContainer.withValues(alpha: 0.8),
                      ),

                      child: SvgPicture.asset(
                        MyIcons.learn,
                        colorFilter: ColorFilter.mode(
                          color.primary,
                          BlendMode.srcIn,
                        ),
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name.isEmpty ? 'N/A' : item.name,
                            style: MyTextStyle.poppinsLarge600.copyWith(
                              color: color.primary,
                              height: 1.2.h,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            wordCountText,
                            style: MyTextStyle.poppinsMedium400.copyWith(
                              color: color.outline.withValues(alpha: 0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  final args = QuizAttemptArgs(
                    type: QuizAttemptType.topic,
                    topicId: item.id,
                    title: item.name,
                  );
                  context.push(AppRouter.quizAttempPath, extra: args);
                },
                style: IconButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                ),
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: color.outline.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
