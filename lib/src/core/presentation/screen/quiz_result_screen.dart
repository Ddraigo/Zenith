import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/core/presentation/controller/quiz_result_notifier.dart';
import 'package:app_demo/src/core/provider/reward_summary_provider.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../domain/quiz_attempt_args.dart';

class QuizResultScreen extends ConsumerStatefulWidget {
  const QuizResultScreen({
    super.key,
    required this.quizAttemp,
    required this.arg,
  });
  final QuizAttemptsModel quizAttemp;
  final QuizAttemptArgs arg;

  @override
  ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  bool _rewardDialogShown = false;

  void _showRewardDialog(RewardSummary reward, ColorScheme color) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            decoration: BoxDecoration(
              color: color.onPrimary,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                SvgPicture.asset(MyIcons.reward),
                SizedBox(height: 16.h),

                // Title
                Text(
                  'Chúc mừng bạn',
                  style: MyTextStyle.poppinsLarge700.copyWith(
                    fontSize: 24.sp,
                    color: color.primary,
                  ),
                ),
                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  'Nhận được điểm thưởng',
                  style: MyTextStyle.poppinsMedium.copyWith(
                    fontSize: 12.sp,
                    color: color.outline.withValues(alpha: 0.6),
                  ),
                ),
                SizedBox(height: 20.h),

                // Points earned
                if (reward.pointAdded > 0)
                  Container(
                    padding: EdgeInsets.all(12.r),
                    margin: EdgeInsets.only(bottom: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: color.outline.withValues(alpha: 0.08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color.onPrimary,
                              ),
                              child: Icon(
                                Icons.stars_rounded,
                                color: color.primary,
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ĐIỂM THƯỞNG',
                                  style: MyTextStyle.poppinsMedium.copyWith(
                                    fontSize: 10.sp,
                                    color: color.outline.withValues(alpha: 0.7),
                                  ),
                                ),
                                Text(
                                  '+${reward.pointAdded}',
                                  style: MyTextStyle.poppinsLarge700.copyWith(
                                    fontSize: 16.sp,
                                    color: color.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'TỔNG',
                              style: MyTextStyle.poppinsMedium.copyWith(
                                fontSize: 10.sp,
                                color: color.outline.withValues(alpha: 0.7),
                              ),
                            ),
                            Text(
                              '500',
                              style: MyTextStyle.poppinsLarge700.copyWith(
                                fontSize: 16.sp,
                                color: color.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                // Streak
                if (reward.streakAdded > 0 || reward.streakReset)
                  Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: color.outline.withValues(alpha: 0.08),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color.onPrimary,
                              ),
                              child: Icon(
                                Icons.local_fire_department,
                                color: Colors.red.shade400,
                                size: 24.sp,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'STREAK UP',
                                  style: MyTextStyle.poppinsMedium.copyWith(
                                    fontSize: 10.sp,
                                    color: color.outline.withValues(alpha: 0.7),
                                  ),
                                ),
                                Text(
                                  reward.streakReset
                                      ? '+1'
                                      : '+${reward.streakAdded}',
                                  style: MyTextStyle.poppinsLarge700.copyWith(
                                    fontSize: 16.sp,
                                    color: color.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'HIỆN TẠI',
                              style: MyTextStyle.poppinsMedium.copyWith(
                                fontSize: 10.sp,
                                color: color.outline.withValues(alpha: 0.7),
                              ),
                            ),
                            Text(
                              '${reward.streakCount} Ngày',
                              style: MyTextStyle.poppinsLarge700.copyWith(
                                fontSize: 16.sp,
                                color: const Color(0xFF7B2B7B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                SizedBox(height: 24.h),

                // OK Button
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 5.h),
                      minimumSize: Size(double.maxFinite, 40.h),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      ref.read(rewardSummaryProvider.notifier).state = null;
                      _rewardDialogShown = false;
                    },
                    child: Text(
                      'OK',
                      style: MyTextStyle.poppinsMedium600.copyWith(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final quizResultAsync = ref.watch(
      quizResultProvider(quizAttempId: widget.quizAttemp.id),
    );

    // Watch reward provider
    final reward = ref.watch(rewardSummaryProvider);

    // Show dialog when reward detected
    if (reward != null && !_rewardDialogShown) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_rewardDialogShown && context.mounted) {
          _rewardDialogShown = true;
          _showRewardDialog(reward, color);
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        elevation: 1,
        centerTitle: true,
        title: const Text('Kết quả'),
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            ref.read(homeTapProvider.notifier).state = 2;
            context.go(AppRouter.homePath);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
                onPressed: () {
                  context.pushReplacement(
                    AppRouter.quizAttempPath,
                    extra: widget.arg,
                  );
                },
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Làm lại'),
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
                onPressed: () {
                  context.go(AppRouter.homePath);
                },
                icon: const Icon(Icons.home_rounded),
                label: const Text('Về trang chủ'),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20.h,
            children: [
              _summaryResult(color),
              quizResultAsync.when(
                data: (quizResults) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quizResults.length,
                    itemBuilder: (context, index) {
                      final item = quizResults[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: color.onPrimary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 1.h,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  item.isCorrect
                                      ? Icons.check_circle_outline_rounded
                                      : Icons.cancel_outlined,
                                  color: item.isCorrect
                                      ? const Color.fromARGB(255, 40, 116, 41)
                                      : color.error,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Đáp án',
                                        style: MyTextStyle.poppinsMedium
                                            .copyWith(
                                              color: color.outline.withValues(
                                                alpha: 0.7,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        item.question,
                                        style: MyTextStyle.poppinsLarge600
                                            .copyWith(color: color.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Trả lời',
                                        style: MyTextStyle.poppinsMedium
                                            .copyWith(
                                              color: color.outline.withValues(
                                                alpha: 0.7,
                                              ),
                                            ),
                                      ),
                                      Text(
                                        item.userAnswer,
                                        style: MyTextStyle.poppinsLarge600
                                            .copyWith(
                                              color: item.isCorrect
                                                  ? AppColors.gradientDark
                                                  : color.error.withValues(
                                                      alpha: 0.7,
                                                    ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                error: (e, _) => Center(child: Text('Lỗi $e')),
                loading: () => Center(child: CircularProgressIndicator()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryResult(ColorScheme color) {
    final inCorrectAnwer =
        widget.quizAttemp.totalQuestions -
        (widget.quizAttemp.correctAnswers ?? 0);
    return Row(
      spacing: 16.h,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: color.onPrimary,
            ),

            height: 160.h,
            width: 160.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    strokeWidth: 10,
                    backgroundColor: color.outline.withValues(alpha: 0.4),
                    value: ((widget.quizAttemp.score ?? 0.0) / 100).clamp(
                      0.0,
                      1.0,
                    ),
                    valueColor: AlwaysStoppedAnimation<Color>(color.primary),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${widget.quizAttemp.score}%",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: color.primary,
                      ),
                    ),
                    Text(
                      "${widget.quizAttemp.correctAnswers ?? 0} / ${widget.quizAttemp.totalQuestions}",
                      style: MyTextStyle.poppinsMedium600.copyWith(
                        color: color.outline.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 160.h,
            child: Column(
              spacing: 8.h,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primary300.withValues(alpha: 0.3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: const Color.fromARGB(255, 40, 116, 41),
                        ),

                        Text(
                          '${widget.quizAttemp.correctAnswers}',
                          style: MyTextStyle.poppinsLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: color.error.withValues(alpha: 0.1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cancel_rounded, color: color.error),
                        Text(
                          '$inCorrectAnwer',
                          style: MyTextStyle.poppinsLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
