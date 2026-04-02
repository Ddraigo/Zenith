import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:flutter/material.dart';

class DailyWordList extends StatelessWidget {
  const DailyWordList({
    super.key,
    required this.listWordDay,
    this.onItemSelected, 
    required this.title, 
    this.topicName,
  });

  final Map<int, List<UserDailyWordModel>> listWordDay;
  final void Function(int topicId)? onItemSelected;
  final String title;
  final String Function(int topicId)? topicName;


  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: title),
        const SizedBox(height: 8),
        _buildHorizontalList(context, listWordDay),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHorizontalList(
    BuildContext context,
    Map<int, List<UserDailyWordModel>> items,
  ) {
    if (items.isEmpty) {
      return const Text('Không có dữ liệu');
    }

    return Column(
      children: items.entries.map((entry) {
        final topicId = entry.key;
        final items = entry.value;
        final name = topicName?.call(topicId) ?? 'Chủ đề $topicId';

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => onItemSelected?.call(topicId),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              ...items.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    '• ${item.flashcardId} - ${item.assignedDate.toIso8601String().split('T').first}',
                  ),
                );
              }),
            ],
          ),
        );
      }).toList(),
    
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
