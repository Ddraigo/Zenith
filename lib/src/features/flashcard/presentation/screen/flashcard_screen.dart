import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/shared_flashcard_notifier.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/daily_word_bottom_sheet.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_list.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlashcardScreen extends ConsumerWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final currentIndex = ref.watch(flashcardIndexProvider);
    final topicAsync = ref.watch(listTopicProvider);

    final selectedTopicId = ref.watch(selectedTopicProvider) ?? 0;
    final flashcardAsync = ref.watch(getFlashcardsProvider(selectedTopicId));
    

    final getTopicName = topicAsync.maybeWhen(
      data: (topics) {
        if (flashcardAsync.hasValue) {
          final flashcards = flashcardAsync.value ?? [];
          if (flashcards.isNotEmpty) {
            final topicId = flashcards.first.topicId;
            for (final topic in topics) {
              if (topic.id == topicId) {
                return topic.name;
              }
            }
          }
        }
        return 'N/A';
      },
      orElse: () => 'Lỗi: N/A',
    );

    return flashcardAsync.when(
      data: (defaultFlashcards) {
        final getIndex = currentIndex.clamp(
          0,
          defaultFlashcards.isEmpty ? 0 : defaultFlashcards.length - 1,
        );

        return Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _header(colorScheme, context, ref),
              SizedBox(height: 16),
              _todayProgress(
                colorScheme,
                getTopicName.isEmpty ? 'N/A' : getTopicName,
                defaultFlashcards.isEmpty ? 0 : getIndex + 1,
                defaultFlashcards.isEmpty ? 0 : defaultFlashcards.length,
              ),
              SizedBox(height: 16),
              if (defaultFlashcards.isEmpty)
                _flashcardEmpty(colorScheme)
              else
                Expanded(
                  child: FlashcardList(
                    flashcards: defaultFlashcards,
                    onSwiped: (index) {
                      ref.read(flashcardIndexProvider.notifier).state = index;
                    },
                  ),
                ),
            ],
          ),
        );
      },
      error: (e, _) => Center(child: Text('Lỗi: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _flashcardEmpty(ColorScheme colorScheme) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.r),
        ),
        elevation: 0,
        color: colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(30.r),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Không có từ vựng nào',
                  textAlign: TextAlign.center,
                  style: MyTextStyle.poppinsHeading2.copyWith(
                    fontSize: 40.sp,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 52.h),
              Text(
                'Quay lại sau',
                style: MyTextStyle.poppinsMedium400.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(ColorScheme color, BuildContext context, WidgetRef ref) {
    final streakDayAsycn = ref.watch(streakDayProvider);
    final streakDay = streakDayAsycn.value ?? 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                'WELCOME BACK',
                style: MyTextStyle.poppinsSmall600.copyWith(
                  color: color.outline,
                ),
              ),
              Text('Hello, John', style: MyTextStyle.poppinsHeading2),
            ],
          ),
        ),

        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => const DailyWordBottomSheet(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color.onInverseSurface,
            ),

            child: Row(
              spacing: 2,
              children: [
                SvgPicture.asset(
                  MyIcons.fireFill,
                  colorFilter: ColorFilter.mode(color.error, BlendMode.srcIn),
                ),
                Text(
                  '$streakDay Streak',
                  style: MyTextStyle.poppinsMedium400.copyWith(
                    color: color.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _todayProgress(
    ColorScheme color,
    String topicName,
    int currentIndex,
    int total,
  ) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CHỦ ĐỀ HÔM NAY',
                style: MyTextStyle.poppinsLarge400.copyWith(
                  color: color.outline,
                ),
              ),
              Text(
                'TIẾN ĐỘ',
                style: MyTextStyle.poppinsLarge400.copyWith(
                  color: color.outline,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(topicName, style: MyTextStyle.poppinsLarge600),
              Row(
                spacing: 4,
                children: [
                  Text(
                    '$currentIndex/$total',
                    style: MyTextStyle.poppinsLarge600.copyWith(
                      color: color.primary,
                    ),
                  ),
                  Text('từ', style: MyTextStyle.poppinsLarge600),
                ],
              ),
            ],
          ),
          LinearProgressIndicator(
            minHeight: 16.h,
            borderRadius: BorderRadius.circular(10.r),
            backgroundColor: color.outline.withOpacity(0.4),
            value: total > 0 ? currentIndex / total : 0,
            valueColor: AlwaysStoppedAnimation<Color>(color.primary),
          ),
        ],
      ),
    );
  }
}
