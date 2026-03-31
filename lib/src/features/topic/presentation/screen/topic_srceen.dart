import 'package:app_demo/src/features/topic/presentation/controller/topic_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/screen/flashcard_tab.dart';
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
    final topicAsync = ref.watch(topicProvider);
    
    return topicAsync.when(
      data: (topics) {
        if (topics.isEmpty) {
          return const Center(child: Text('Không có danh sách'));
        }
        
        return DefaultTabController(
          length: topics.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Topic')),
              bottom: TabBar(
                tabs: [
                  for (final topic in topics) Tab(text: topic.name),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                for (final topic in topics)
                  FlashcardTab(topicId: topic.id),
              ],
            ),
          ),
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
