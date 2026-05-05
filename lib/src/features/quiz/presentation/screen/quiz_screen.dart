import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/flashcard/domain/daily_word_summary.dart';
import 'package:app_demo/src/features/quiz/presentation/screen/quiz_list.dart';
import 'package:app_demo/src/shared/utils/helper_function.dart';
import 'package:app_demo/src/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../configs/routes/app_router.dart';
import '../../../../core/provider/shared_flashcard_notifier.dart';
import '../../../../shared/constants/format.dart';
import '../../../../shared/http/app_exception.dart';
import '../../../../core/domain/quiz_attempt_args.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;

    final dailyWordListAsync = ref.watch(
      getDailyTopicsGroupedProvider(dayRange: 7),
    );
    final topicListAsync = ref.watch(getTopicListProvider);

    return dailyWordListAsync.when(
      data: (dailyWords) {
        return topicListAsync.when(
          data: (topics) {
            final todayKey = Format.normalizeDate(DateTime.now());
            final todayWords = dailyWords[todayKey];
            final DailyWordSummaryModel todayProgress =
                todayWords?.first ??
                DailyWordSummaryModel(
                  userId: '',
                  topicId: 0,
                  assignedDate: DateTime.now(),
                  topicName: '',
                  totalWords: 0,
                );

            final dailyItems = dailyWords.values
                .expand((items) => items)
                .toList();

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getDailyTopicsGroupedProvider(dayRange: 7));
                ref.invalidate(getTopicListProvider);
              },
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                children: [
                  if (dailyItems.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: _dailyProgress(context, color, todayProgress),
                    ),
                  QuizList(
                    userDailyWordList: dailyItems,
                    topicList: topics,
                    ref: ref,
                  ),
                ],
              ),
            );
          },
          loading: () => const LoadingWidget(isLoading: true, child: SizedBox.shrink()),
          error: (error, _) {
            final msg = error is AppException
                ? MyHelper.getErrorMessage(error)
                : 'Đã xảy ra lỗi: $error';
            return Center(child: Text(msg));
          },
        );
      },

      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) {
        final msg = error is AppException
            ? MyHelper.getErrorMessage(error)
            : 'Đã xảy ra lỗi: $error';
        return Center(child: Text(msg));
      },
    );
  }

  Widget _dailyProgress(
    BuildContext context,
    ColorScheme color,
    DailyWordSummaryModel todayProgress,
  ) {
    return Container(
      padding: EdgeInsets.all(32.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48.r),
        // gradient: LinearGradient(
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomRight,
        //   colors: [color.primaryContainer, color.onPrimary.withValues(alpha: 0.5)],
        //   transform: GradientRotation(45),
        // ),
        gradient: RadialGradient(
          center: Alignment(0.6, -0.5),
          radius: 0.8,
          colors: <Color>[
            color.primaryContainer.withValues(alpha: 0.5),
            color.onPrimary,
          ],
          stops: <double>[0.1, 0.9],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.005),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chinh phục ${todayProgress.totalWords} từ hôm nay",
            style: MyTextStyle.poppinsHeading2,
          ),
          SizedBox(height: 2.h,),
          Text(
            "Làm quiz ngay để giữ chuỗi ngày học hành siêng năng nhé!",
            style: MyTextStyle.poppinsLarge400.copyWith(color: color.secondary),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 25.h,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6.h,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tiến độ',
                          style: MyTextStyle.poppinsMedium600.copyWith(
                            color: color.primary.withValues(alpha: 0.9),
                          ),
                        ),
                        Text(
                          '${(todayProgress.progressPrecent * 100).round()}%',
                          style: MyTextStyle.poppinsMedium600.copyWith(
                            color: color.primary,
                          ),
                        ),
                      ],
                    ),
                    LinearProgressIndicator(
                      minHeight: 10.h,
                      borderRadius: BorderRadius.circular(10.r),
                      backgroundColor: color.outline.withValues(alpha: 0.4),
                      value: todayProgress.progressPrecent,
                      valueColor: AlwaysStoppedAnimation<Color>(color.primary),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final args = QuizAttemptArgs(
                    type: QuizAttemptType.daily,
                    topicId: todayProgress.topicId,
                    title: todayProgress.topicName,
                    assignedDate: todayProgress.assignedDate,
                  );
                  if (todayProgress.userId.isNotEmpty &&
                      todayProgress.topicId != 0) {
                    context.push(AppRouter.quizAttempPath, extra: args);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(20.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.w,
                    vertical: 10.h,
                  ),
                  minimumSize: Size(40.w, 20.h),
                  shadowColor: color.primary.withValues(alpha: 0.5),
                  elevation: 3,
                ),
                child: Text('Start'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
