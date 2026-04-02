import 'package:app_demo/configs/themes/app_colors.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/flashcard/presentation/controller/flashcard_notifier.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_list.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/button_custom.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

final selectedTopicProvider = StateProvider<int?>((ref) => 0);

class FlashcardScreen extends ConsumerWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final flashcardAsync = ref.watch(flashcardProvider);
    final currentIndex = ref.watch(flashcardIndexProvider);

    // final todayAsync = ref.watch(dailyWordProvider(DateTime.now()));
    // final yesterdayAsync = ref.watch(dailyWordProvider(DateTime.now().subtract(const Duration(days: 1))));
    // final selectedTopicId = ref.watch(selectedTopicProvider);

    return flashcardAsync.when(
      data: (defaultFlashcards) {
        if (defaultFlashcards.isEmpty) {
          return Center(child: Text('Không có dữ liệu'));
        }
        // final getIndex = currentIndex.clamp(0, defaultFlashcards.length-1);
        return Padding(
          padding: EdgeInsets.all(32.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _header(colorScheme),
              SizedBox(height: 16),
              // Flexible(
              //   child: todayAsync.when(
              //     data: (data){
              //       final todayWords = groupByTopic(data);
              //       return DailyWordList(
              //         listWordDay: todayWords,
              //         title: "Hôm nay",
              //         onItemSelected: (topicId){
              //           ref.read(selectedTopicProvider.notifier).state = topicId;
              //         },
              //       );
              //     },
              //     error: (e, _) => Center(child: Text('Lỗi: $e')),
              //     loading: () => const Center(child: CircularProgressIndicator()),
              //   ),
              // ),
              // Flexible(
              //   child: yesterdayAsync.when(
              //     data: (data){
              //       final yesterdayWords = groupByTopic(data);
              //       return DailyWordList(
              //         listWordDay: yesterdayWords,
              //         title: "Hôm qua",
              //         onItemSelected: (topicId){
              //           ref.read(selectedTopicProvider.notifier).state = topicId;
              //         },
              //       );
              //     },
              //     error: (e, _) => Center(child: Text('Lỗi: $e')),
              //     loading: () => const Center(child: CircularProgressIndicator()),
              //   ),
              // ),
              SizedBox(height: 16),
              _todayProgress(
                colorScheme,
                'Travel',
                currentIndex + 1,
                defaultFlashcards.length,
              ),
              SizedBox(height: 16),
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

  // Map<int, List<UserDailyWordModel>> groupByTopic(
  //   List<UserDailyWordModel> items,
  // ){
  //   final result = <int, List<UserDailyWordModel>>{};

  //   for(final item in items){
  //     final topicId = item.topicId ?? 0;
  //     result.putIfAbsent(topicId, () => []);
  //     result[topicId]!.add(item);
  //   }
  //   return result;
  // }

  Widget _header(ColorScheme color) {
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

        Container(
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
                '5 Ngày',
                style: MyTextStyle.poppinsMedium400.copyWith(
                  color: color.primary,
                ),
              ),
            ],
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
              Text(topicName, style: MyTextStyle.poppinsLarge600,),
              Row(
                spacing: 4,
                children: [
                  Text(
                    '$currentIndex/$total',
                    style: MyTextStyle.poppinsLarge600.copyWith(color: color.primary),
                  ),
                  Text('từ', style: MyTextStyle.poppinsLarge600),
                ],
              ),
            ],
          ),
          LinearProgressIndicator(
            minHeight: 16.h,
            borderRadius: BorderRadius.circular(10.r),
            backgroundColor: color.primary,
            value: total > 0 ? currentIndex / total : 0,
            valueColor: AlwaysStoppedAnimation<Color>(color.primary),
          ),
        ],
      ),
    );
  }
}
