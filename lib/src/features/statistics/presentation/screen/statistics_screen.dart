import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/shared_flashcard_notifier.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/statistics/presentation/controller/statistics_notifier.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:app_demo/src/shared/widgets/bottom_sheet_list_item.dart';

import '../../../../core/domain/quiz_attempt_args.dart';
import '../../../../shared/constants/format.dart';
import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/widgets/retry_widget.dart';

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
    final hasProfileAsync = ref.watch(hasProfileProvider);

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            final hasProfile = await ref.refresh(hasProfileProvider.future);
            if (hasProfile) {
              await ref.read(statisticsProvider.notifier).refresh();
            }
          },
          child: hasProfileAsync.when(
            data: (hasProfile) {
              if (!hasProfile) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hồ sơ cá nhân chưa được tạo.',
                          style: MyTextStyle.poppinsMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 16.w),
                          ),
                          onPressed: () => context.push(AppRouter.profilePath),
                          child: const Text('Tạo hồ sơ'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final topicList = ref.watch(getTopicListProvider);
              final statisticsAsycn = ref.watch(statisticsProvider);
              final streakDay = ref.watch(streakDayProvider);
              return statisticsAsycn.when(
                data: (data) {
                  final wordMaster = data.userFlashcardProgress
                      .where((items) => items.wrongCount == 0)
                      .length;
                  final totalWord = data.userFlashcardProgress.length;

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      spacing: 8.h,
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 1.2,
                          children: [
                            _overviewItems(
                              color,
                              streakDay.value ?? 0, // data.userStatsModel.streakCount,
                              MyIcons.streakPurple,
                              'STREAK DAYS',
                            ),
                            _overviewItems(
                              color,
                              data.userStatsModel.totalPoints,
                              MyIcons.starGreen,
                              'TOTAL POINTS',
                            ),
                            _overviewItems(
                              color,
                              wordMaster,
                              MyIcons.bookPurple,
                              'WORDS MASTERED',
                            ),
                            _overviewItems(
                              color,
                              totalWord,
                              MyIcons.totalLearn,
                              'TOTAL WORDS',
                            ),
                          ],
                        ),
                        // SizedBox(height: 6.h),
                        // _statsProgress(color),
                        SizedBox(height: 8.h),
                        if (data.quizAttemptsModel.isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Quiz gần đây',
                                style: MyTextStyle.poppinsLarge600.copyWith(
                                  fontSize: 20.sp,
                                ),
                              ),
                              
                                TextButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (_) => BottomSheetListItem(
                                        title: 'Quiz đã làm',
                                        builder: (scrollController) =>
                                            _reviewQuizListSheet(
                                          quizList: data.quizAttemptsModel,
                                          topicList: topicList,
                                          color: color,
                                          context: context,
                                          scrollController: scrollController,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Tất cả',
                                    style: MyTextStyle.poppinsMedium,
                                  ),
                                ),
                            ],
                          ),
                          _reviewQuizList(
                            quizList: data.quizAttemptsModel,
                            topicList: topicList,
                            color: color,
                            context: context,
                          ),
                      ],
                    ),
                  );
                },
                error: (error, _) {
                  final msg = error is AppException
                      ? MyHelper.getErrorMessage(error)
                      : 'Đã xảy ra lỗi';
                  return RetryWidget(
                    msg: msg,
                    onPressed: () => ref.refresh(statisticsProvider),
                  );
                },
                loading: () => SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(child: CircularProgressIndicator()),
                ),
              );
            },
            error: (error, _) {
              final msg = error is AppException
                  ? MyHelper.getErrorMessage(error)
                  : 'Đã xảy ra lỗi';
              return RetryWidget(
                msg: msg,
                onPressed: () => ref.refresh(hasProfileProvider),
              );
            },
            loading: () => SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
        ),
      
    );
  }

  Widget _reviewQuizList({
    required List<QuizAttemptsModel> quizList,
    required AsyncValue<List<TopicModel>> topicList,
    required ColorScheme color,
    required BuildContext context,
  }) {
    final previewItems = quizList.take(10).toList();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: previewItems.length,
      itemBuilder: (context, index) {
        final item = previewItems[index];
        
        final topicName = topicList.when(
          data: (topics) => topics
              .firstWhere(
                (t) => t.id == item.topicId,
                orElse: () => TopicModel(id: 0, name: 'N/A'),
              )
              .name,
          error: (_, _) => 'error: N/A',
          loading: () => '...',
        );
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(48.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(48.r),
              onTap: (){
                context.push(
                    AppRouter.quizResultPath,
                    extra: QuizResultRouteArgs(
                      quizAttemp: item, 
                      arg: QuizAttemptArgs(
                      type: parseAttemptType(item.attemptType),
                      topicId: item.topicId ?? 0,
                      attemptId: item.id,
                      assignedDate: Format.normalizeDate(item.createdAt),
                    )),
                  );
              },
            
              child: Ink(
                // margin: EdgeInsets.symmetric(vertical: 8.h),
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.r),
                  color: color.onPrimary,
                ),
                child: Row(
                  spacing: 16.h,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: color.outline.withValues(alpha: 0.09),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        width: 30.w,
                        height: 30.h,
                        MyIcons.learn,
                        colorFilter: ColorFilter.mode(color.primary, BlendMode.srcIn),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topicName,
                            style: MyTextStyle.poppinsLarge600.copyWith(
                              color: color.inverseSurface.withValues(alpha: 0.8),
                            ),
                          ),
                          Text(
                            Format.formatDMY(item.createdAt),
                            style: MyTextStyle.poppinsMedium600.copyWith(
                              color: color.outline.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${item.score} score',
                            style: MyTextStyle.poppinsLarge600.copyWith(
                              color: color.primary,
                            ),
                          ),
                          Text(
                            '${item.correctAnswers}/${item.totalQuestions}',
                            style: MyTextStyle.poppinsMedium600.copyWith(
                              color: color.outline.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _reviewQuizListSheet({
    required List<QuizAttemptsModel> quizList,
    required AsyncValue<List<TopicModel>> topicList,
    required ColorScheme color,
    required BuildContext context,
    required ScrollController scrollController,
  }) {
    return ListView.builder(
      controller: scrollController,
      itemCount: quizList.length,
      itemBuilder: (context, index) {
        final item = quizList[index];
        final topicName = topicList.when(
          data: (topics) => topics
              .firstWhere(
                (t) => t.id == item.topicId,
                orElse: () => TopicModel(id: 0, name: 'N/A'),
              )
              .name,
          error: (_, _) => 'error: N/A',
          loading: () => '...',
        );
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(48.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(48.r),
              onTap: () {
                Navigator.of(context).pop();
                context.push(
                  AppRouter.quizResultPath,
                  extra: QuizResultRouteArgs(
                    quizAttemp: item,
                    arg: QuizAttemptArgs(
                      type: parseAttemptType(item.attemptType),
                      topicId: item.topicId ?? 0,
                      attemptId: item.id,
                      assignedDate: Format.normalizeDate(item.createdAt),
                    ),
                  ),
                );
              },
              child: Ink(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48.r),
                  color: color.onPrimary,
                ),
                child: Row(
                  spacing: 16.h,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: color.outline.withValues(alpha: 0.09),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        width: 30.w,
                        height: 30.h,
                        MyIcons.learn,
                        colorFilter: ColorFilter.mode(
                          color.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topicName,
                            style: MyTextStyle.poppinsLarge600.copyWith(
                              color: color.inverseSurface
                                  .withValues(alpha: 0.8),
                            ),
                          ),
                          Text(
                            Format.formatDMY(item.createdAt),
                            style: MyTextStyle.poppinsMedium600.copyWith(
                              color: color.outline.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${item.score} score',
                            style: MyTextStyle.poppinsLarge600.copyWith(
                              color: color.primary,
                            ),
                          ),
                          Text(
                            '${item.correctAnswers}/${item.totalQuestions}',
                            style: MyTextStyle.poppinsMedium600.copyWith(
                              color: color.outline.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _statsProgress(ColorScheme color) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: color.outline.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly Mastery',
                  style: MyTextStyle.poppinsLarge600.copyWith(fontSize: 26.sp),
                ),
                Text(
                  'You ve mastered 12% more vocabulary than last month.',
                  style: MyTextStyle.poppinsMedium,
                ),
                LinearProgressIndicator(
                  minHeight: 14.h,
                  borderRadius: BorderRadius.circular(10.r),
                  backgroundColor: color.outline.withValues(alpha: 0.4),
                  value: 6 / 10,
                  valueColor: AlwaysStoppedAnimation<Color>(color.primary),
                ),
              ],
            ),
          ),
          Container(decoration: BoxDecoration(shape: BoxShape.circle)),
        ],
      ),
    );
  }

  Widget _overviewItems(
    ColorScheme color,
    int value,
    String icon,
    String subTitle,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: color.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8.h,
        children: [
          SvgPicture.asset(
            icon,                        
            width: 40.w,
            height: 40.h,),
          Padding(
            padding:  EdgeInsets.only(left: 5.w),
            child: Text('$value', style: MyTextStyle.poppinsHeading2),
          ),
          Text(
            subTitle,
            style: MyTextStyle.poppinsMedium400.copyWith(
              color: color.outline.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _streakView(ColorScheme color) {
  //   return Container(
  //     padding: EdgeInsets.all(16.h),
  //     decoration: BoxDecoration(
  //       color: color.onPrimary,
  //       borderRadius: BorderRadius.circular(32.r),
  //       gradient: RadialGradient(
  //         center: Alignment.center, // Tâm loang màu ở giữa
  //         radius: 0.7, // Độ rộng của vùng loang
  //         colors: [
  //           Colors.amber.shade50, // Màu ở tâm (nhạt và trong suốt)
  //           color.onPrimary, // Mờ dần về phía cạnh
  //         ],
  //         stops: const [0.0, 1.0], // 0.0 là tại tâm, 1.0 là tại rìa radius
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withValues(alpha: 0.05),
  //           blurRadius: 20,
  //           offset: Offset(0, 10),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       spacing: 4.h,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           'Chuỗi hiện tại',
  //           style: MyTextStyle.poppinsLarge600.copyWith(
  //             color: color.primary,
  //             fontSize: 22.sp,
  //           ),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           spacing: 5.w,
  //           children: [
  //             Text('5', style: MyTextStyle.poppinsHeading2),
  //             SvgPicture.asset(MyIcons.streak, height: 40.h, width: 40.w),
  //           ],
  //         ),
  //         Text(
  //           'Day streak',
  //           style: MyTextStyle.poppinsLarge.copyWith(
  //             color: color.outline.withValues(alpha: 0.5),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
