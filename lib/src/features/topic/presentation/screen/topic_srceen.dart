import 'package:app_demo/src/core/controller/shared_flashcard_notifier.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/screen/list_topic.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicSrceen extends ConsumerWidget {
  const TopicSrceen({super.key});

  String _getErrorMessage(AppException exception) {
    return exception.when(
      connectivity: () => 'Lỗi kết nối mạng',
      unauthorized: () => 'Không có quyền truy cập',
      errorWithMessage: (msg) => msg,
      unknown: () => 'Lỗi không xác định',
      badRequest: (msg) => msg,
      server: (msg) => msg,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicAsync = ref.watch(listTopicProvider);
    // final selectedTopicId = ref.watch(selectedTopicProvider);
    return topicAsync.when(
      data: (topics) {
        if (topics.isEmpty) {
          return const Center(child: Text('Không có danh sách'));
        }

        return ListTopic(
            onTopicSelected: (topicId) {
              // Set daily mode = false - xem tất cả flashcards của topic
              ref.read(isDailyModeProvider.notifier).state = false;
              ref.read(selectedTopicProvider.notifier).state = topicId;
              final topic = topics.firstWhere(
                (t) => t.id == topicId,
                orElse: () => topics.first,
              );
              ref.read(selectedTopicDaily.notifier).state = topicId;
              ref.read(flashcardIndexProvider.notifier).state = 0;
              ref.read(homeTapProvider.notifier).state = 0;
              // context.go(
              //   '${AppRouter.flashcardPath}/$topicId',
              //   extra: topic.name,
              // );
              // context.push(
              //   '${AppRouter.flashcardPath}/$topicId',
              //   extra: topic.name,
              // );
            },
            topics: topics,
          
        );
      },
      error: (error, _) {
        final msg = error is AppException
            ? _getErrorMessage(error)
            : 'Đã xảy ra lỗi: $error';
        return Center(child: Text(msg));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
