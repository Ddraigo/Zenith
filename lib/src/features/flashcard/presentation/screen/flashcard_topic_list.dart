// import 'package:app_demo/src/core/domain/flashcard_model.dart';
// import 'package:app_demo/src/features/flashcard/presentation/controller/flashcard_notifier.dart';
// import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class FlashcardTopicList extends ConsumerWidget {
//   const FlashcardTopicList({super.key, this.onTopicSelected, required this.flashcard});
//   final Function(int topicId)? onTopicSelected;
//   final List<FlashcardModel> flashcard;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final topicAsync = ref.watch(flashcardProvider);
//     final selectedTopicId = ref.watch(selectedTopicProvider) ?? 0;

//     return topicAsync.when(
//       data: (topics) {
//         if (topics.isEmpty) {
//           return const Center(child: Text('Không tìm thấy danh sách nào'));
//         }
//         return ListView.builder(
//           itemCount: topics.length,
//           itemExtent: 100,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             final topic = topics[index];
//             final isSelected = topic.id != selectedTopicId;

//             return GestureDetector(
//               onTap: () {
//                 ref
//                     .read(selectedTopicProvider.notifier).state = selectedTopicId;
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(left: 16),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: isSelected
//                       ? Theme.of(context).colorScheme.primaryContainer
//                       : Theme.of(context).colorScheme.surface,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: isSelected
//                         ? Theme.of(context).colorScheme.primary
//                         : Theme.of(context).colorScheme.outlineVariant,
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(topic.),
//               ),
//             );
//           },
//         );
//       },
//       error: (e, _) => Center(child: Text('Lỗi: $e')),
//       loading: () => Center(child: CircularProgressIndicator()),
//     );
//   }
// }
