import 'dart:math' as math;

import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/quiz/domain/question_model.dart';
import 'package:app_demo/src/core/domain/quiz_attempt_args.dart';
import 'package:app_demo/src/features/quiz/presentation/controller/quiz_notifier.dart';
import 'package:app_demo/src/shared/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/provider/shared_flashcard_notifier.dart';
import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/widgets/retry_widget.dart';
import '../../../home/presentation/home_screen.dart';

class QuizAttempScreen extends ConsumerStatefulWidget {
  const QuizAttempScreen({super.key, required this.arg});
  final QuizAttemptArgs arg;

  @override
  ConsumerState<QuizAttempScreen> createState() => _QuizAttempScreenState();
}

class _QuizAttempScreenState extends ConsumerState<QuizAttempScreen> {
  late final TextEditingController userAnswer;
  late final FocusNode _answerFocusNode;
  late final CardSwiperController _swiperController;
  bool _isError = false;
  bool _isSubmitting = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    userAnswer = TextEditingController();
    _answerFocusNode = FocusNode();
    _swiperController = CardSwiperController();
    _answerFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _swiperController.dispose();
    _answerFocusNode.dispose();
    userAnswer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final quizAsync = ref.watch(
      quizSessionProvider(
        widget.arg.type,
        widget.arg.topicId,
        widget.arg.assignedDate,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        centerTitle: true,
        title: Text(widget.arg.title ?? ''),
        leading: IconButton(
          onPressed: () {
            ref.read(homeTapProvider.notifier).state = 2;
            context.go(AppRouter.homePath);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: quizAsync.when(
          data: (quizes) {
            if (quizes.questions.isEmpty) {
              return const Center(child: Text('Không có câu hỏi để làm bài'));
            }

            final isLastQuestion = _currentIndex >= quizes.questions.length - 1;

            final answeredCount = quizes.questions
                .where(
                  (q) => (quizes.userAnswers[q.flashcardId] ?? '')
                      .trim()
                      .isNotEmpty,
                )
                .length;
            final progressValue = (answeredCount / quizes.questions.length)
                .clamp(0.0, 1.0);
            final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
            final availableHeight = MediaQuery.sizeOf(context).height - keyboardInset;
            final cardHeight = math.max(180.h, availableHeight * 0.28);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tiến độ',
                              style: MyTextStyle.poppinsMedium600.copyWith(
                                color: color.outline.withValues(alpha: 0.7),
                              ),
                            ),
                            Text(
                              '$answeredCount/${quizes.questions.length}',
                              style: MyTextStyle.poppinsMedium600.copyWith(
                                color: color.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        LinearProgressIndicator(
                          minHeight: 16.h,
                          borderRadius: BorderRadius.circular(10.r),
                          backgroundColor: color.outline.withValues(alpha: 0.4),
                          value: progressValue,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            color.primary,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: cardHeight,
                          child: CardSwiper(
                            allowedSwipeDirection:
                                const AllowedSwipeDirection.none(),
                            controller: _swiperController,
                            cardsCount: quizes.questions.length,
                            numberOfCardsDisplayed: math.min(
                              3,
                              quizes.questions.length,
                            ),
                            backCardOffset: const Offset(0, 20),
                            cardBuilder:
                                (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) {
                                  final question = quizes.questions[index];
                                  return _questionCard(question, color);
                                },
                            onSwipe: (previousIndex, currentIndex, direction) {
                              setState(() {
                                if (currentIndex != null) {
                                  _currentIndex = currentIndex;
                                }
                                _isError = false;
                              });

                              userAnswer.clear();
                              _isError = false;
                              return true;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      padding: EdgeInsets.only(bottom: keyboardInset + 16.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _userInput(color),
                          SizedBox(height: 20.h),
                          ElevatedButton(
                            onPressed: _isSubmitting
                                ? null
                                : () => _handleNextOrSubmit(quizes),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(32.r),
                              ),
                            ),
                            child: Row(
                              spacing: 8.w,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isLastQuestion ? 'Nộp bài' : 'Câu tiếp theo',
                                  style: MyTextStyle.poppinsMedium600.copyWith(
                                    color: color.onPrimary,
                                  ),
                                ),
                                Icon(
                                  isLastQuestion
                                      ? Icons.check_rounded
                                      : Icons.arrow_forward_rounded,
                                  color: color.onPrimary,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
              onPressed: () => ref.refresh(
                quizSessionProvider(
                  widget.arg.type,
                  widget.arg.topicId,
                  widget.arg.assignedDate,
                ),
              ),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
      
    );
  }

  Future<void> _handleNextOrSubmit(QuestionModel quizes) async {
    final text = userAnswer.text.trim();
    if (text.isEmpty) {
      setState(() => _isError = true);
      return;
    }

    final isLastQuestion = _currentIndex >= quizes.questions.length - 1;
    final currentQuestion = quizes.questions[_currentIndex];

    final notifier = ref.read(
      quizSessionProvider(
        widget.arg.type,
        widget.arg.topicId,
        widget.arg.assignedDate,
      ).notifier,
    );

    notifier.saveAndNext(
      flashcardId: currentQuestion.flashcardId,
      answer: text,
    );

    if (!isLastQuestion) {
      setState(() {
        _isError = false;
      });
      _swiperController.swipe(CardSwiperDirection.left);
      return;
    }

    setState(() {
      _isError = false;
      _isSubmitting = true;
    });

    final result = await notifier.submitQuiz();
    if (!mounted) return;

    setState(() {
      _isSubmitting = false;
    });

    result.fold(
      ifLeft: (error) {
        SnackBarHelper.showError(context, MyHelper.getErrorMessage(error) as AppException);
        // ScaffoldMessenger.of(
        //   context,
        // ).showSnackBar(SnackBar(content: Text(MyHelper.getErrorMessage(error))));
      },
      ifRight: (attempt) {
        ref.invalidate(getDailyTopicsGroupedProvider(dayRange: 7));
       
        context.pushReplacement(
          AppRouter.quizResultPath,
          extra: QuizResultRouteArgs(quizAttemp: attempt, arg: widget.arg),
        );
      },
    );
  }

  Widget _userInput(ColorScheme color) {
    return TextFormField(
      controller: userAnswer,
      focusNode: _answerFocusNode,
      cursorColor: color.primary,
      validator: (value) {
        _isError = value == null || value.isEmpty;
        return null;
      },
      decoration: InputDecoration(
        suffixIconColor: _answerFocusNode.hasFocus
            ? color.primary
            : color.outlineVariant,

        suffixIcon: Icon(Icons.edit),
        hintText: 'Nhập câu trả lời',
        hintStyle: MyTextStyle.poppinsMedium600.copyWith(color: color.outline),
        errorText: _isError ? 'Không được bỏ trống đáp án' : null,
      ),
    );
  }

  Widget _questionCard(QuestionItem question, ColorScheme color) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Câu hỏi',
              style: MyTextStyle.poppinsLarge.copyWith(
                color: color.primary,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.start,
            ),
            Expanded(
              child: Center(
                child: Text(
                  question.question,
                  style: MyTextStyle.poppinsLarge700.copyWith(
                    wordSpacing: 2.w,
                    fontSize: 26.sp,
                  ),
                  maxLines: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
