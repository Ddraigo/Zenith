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
    this.dayRange = 60,
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
      minChildSize: 0.9,
      initialChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
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
                children: [
                  Center(
                    child: Text(
                      'Từ vựng hằng ngày',
                      style: MyTextStyle.poppinsLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: flattened.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: scrollController,
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
                            padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
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
                              statusComplete: item.topic!.statusComplete,
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
            error: (e, _) => Center(child: Text('Đã có lỗi xảy ra')),
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
    required this.statusComplete,
  });
  final DailyWordSummaryModel dailyTopic;
  final String progress;
  final VoidCallback onTap;
  final String statusComplete;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color statusColor = switch (statusComplete) {
      'Bỏ lỡ' => colorScheme.error,
      'Chưa hoàn thành' => Colors.amberAccent.shade400,
      'Hoàn thành' => Colors.green,
      _ => colorScheme.onInverseSurface,
    };
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: onTap,
          child: Ink(
            // margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: colorScheme.error.withValues(alpha: 0.06),
              border: Border.all(
                color: colorScheme.error.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5.h,
                    children: [
                      Text(
                        dailyTopic.topicName,
                        style: MyTextStyle.poppinsLarge600.copyWith(
                          color: colorScheme.primary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Tiến độ: $progress',
                        style: MyTextStyle.poppinsLarge400.copyWith(
                          color: colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    // color: statusColor,
                    border: Border.all(color: statusColor),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  // child: Icon(Icons.check, color: colorScheme.primary),
                  child: Text(
                    statusComplete,
                    style: MyTextStyle.poppinsSmall.copyWith(
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
