import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/flashcard/domain/daily_word_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/provider/shared_flashcard_notifier.dart';

class DailyWordBottomSheet extends ConsumerWidget {
  const DailyWordBottomSheet({
    super.key,
    this.onItemSelected,
    this.dayRange = 7,
  });
  final Function(int topicId)? onItemSelected;
  final int dayRange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupedAsync = ref.watch(
      getDailyTopicsGroupedProvider(dayRange: dayRange),
    );

    final colorScheme = Theme.of(context).colorScheme;
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.onPrimary,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: groupedAsync.when(
            data: (grouped) {
              final flattened =
                  <({DateTime? date, DailyWordSummaryModel? topic})>[];

              for (final entry in grouped.entries) {
                final date = entry.key;
                final topics = entry.value;

                flattened.add((date: date, topic: null));

                for (final topic in topics) {
                  flattened.add((date: null, topic: topic));
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16.h,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Từ vựng hằng ngày',
                      style: MyTextStyle.poppinsLarge600,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: flattened.length,
                      controller: scrollController,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemBuilder: (_, index) {
                        final item = flattened[index];

                        // Track ngày hiện tại từ item header
                        DateTime? currentDate;
                        if (item.date != null) {
                          currentDate = item.date;
                        } else if (index > 0) {
                          // Lấy ngày từ item header trước đó
                          for (int i = index - 1; i >= 0; i--) {
                            if (flattened[i].date != null) {
                              currentDate = flattened[i].date;
                              break;
                            }
                          }
                        }

                        if (item.topic == null && item.date != null) {
                          return Padding(
                            padding: EdgeInsets.only(top: 16.h, bottom: 8.h),
                            child: Text(
                              ref.watch(formatDailyDateProvider(item.date!)),
                              style: MyTextStyle.poppinsLarge600.copyWith(
                                color: colorScheme.primary,
                              ),
                            ),
                          );
                        }

                        if (item.topic != null) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: _TopicTile(
                              dailyTopic: item.topic!,
                              onTap: () {
                                // Lưu ngày + topic được chọn
                                ref.read(selectedDateProvider.notifier).state =
                                    currentDate;
                                ref.read(isDailyModeProvider.notifier).state =
                                    true;
                                ref.read(selectedTopicProvider.notifier).state =
                                    item.topic!.topicId;
                                ref
                                        .read(flashcardIndexProvider.notifier)
                                        .state =
                                    0;
                                onItemSelected?.call(item.topic!.topicId);
                                Navigator.pop(context);
                              },
                              progress: item.topic!.progress,
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              );
            },
            error: (e, _) => Center(child: Text('Lỗi: $e')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

class _TopicTile extends StatelessWidget {
  const _TopicTile({
    required this.dailyTopic,
    required this.onTap,
    required this.progress,
  });
  final DailyWordSummaryModel dailyTopic;
  final String progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10.r),
          side: BorderSide(color: colorScheme.outline),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 6.h,
                children: [
                  Text(
                    dailyTopic.topicName,
                    style: MyTextStyle.poppinsLarge600.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Tiến độ: $progress',
                    style: MyTextStyle.poppinsLarge400.copyWith(
                      color: colorScheme.outline,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorScheme.onInverseSurface,
                ),
                child: Icon(Icons.check, color: colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
