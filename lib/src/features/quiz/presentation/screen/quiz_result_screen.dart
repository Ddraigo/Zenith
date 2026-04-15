import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/features/quiz/domain/quiz_attempts_model.dart';
import 'package:app_demo/src/features/quiz/presentation/controller/quiz_result_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../domain/quiz_attempt_args.dart';

class QuizResultScreen extends ConsumerWidget {
  const QuizResultScreen({
    super.key,
    required this.quizAttemp,
    required this.arg,
  });
  final QuizAttemptsModel quizAttemp;
  final QuizAttemptArgs arg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final quizResultAsync = ref.watch(
      quizResultProvider(quizAttempId: quizAttemp.id),
    );

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
                  context.go(AppRouter.quizAttempPath, extra: arg);
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
                  ref.read(homeTapProvider.notifier).state = 2;
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Đáp án',
                                        style: MyTextStyle.poppinsMedium.copyWith(
                                          color: color.outline.withOpacity(0.7),
                                        ),
                                      ),
                                      Text(
                                          item.question,
                                          style: MyTextStyle.poppinsLarge600.copyWith(
                                            color: color.primary,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Trả lời',
                                        style: MyTextStyle.poppinsMedium.copyWith(
                                          color: color.outline.withOpacity(0.7),
                                        ),
                                      ),
                                      Text(
                                        item.userAnswer,
                                        style: MyTextStyle.poppinsLarge600.copyWith(
                                          color: item.isCorrect
                                              ? AppColors.gradientDark
                                              : color.error.withOpacity(0.7),
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
        quizAttemp.totalQuestions - (quizAttemp.correctAnswers ?? 0);
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
                    backgroundColor: color.outline.withOpacity(0.4),
                    value: ((quizAttemp.score ?? 0.0) / 100).clamp(0.0, 1.0),
                    valueColor: AlwaysStoppedAnimation<Color>(color.primary),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${quizAttemp.score}%",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: color.primary,
                      ),
                    ),
                    Text(
                      "${quizAttemp.correctAnswers ?? 0} / ${quizAttemp.totalQuestions}",
                      style: MyTextStyle.poppinsMedium600.copyWith(
                        color: color.outline.withOpacity(0.7),
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
                      color: AppColors.primary300.withOpacity(0.3),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: const Color.fromARGB(255, 40, 116, 41),
                        ),

                        Text(
                          '${quizAttemp.correctAnswers}',
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
                      color: color.error.withOpacity(0.1),
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
