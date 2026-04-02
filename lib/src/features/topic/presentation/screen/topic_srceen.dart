import 'package:app_demo/src/features/topic/presentation/controller/selected_topic_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/screen/list_topic.dart';
import 'package:app_demo/src/features/topic/presentation/screen/word_list.dart';
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
    final selectedTopicId = ref.watch(selectedTopicProvider);
    return topicAsync.when(
      data: (topics) {
        if (topics.isEmpty) {
          return const Center(child: Text('Không có danh sách'));
        }

        if(selectedTopicId == null){
          return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Topic')),
            ),
            body: ListTopic(
              onTopicSelected: (topicId){
                ref.read(selectedTopicProvider);
              }, 
              topics: topics,
            ),
          );
        }
        
        final selectedTopic = topics.firstWhere((t) => t.id == selectedTopicId);
          return Scaffold(
              appBar: AppBar(
                title: Text(selectedTopic.name),
                leading: IconButton(
                  onPressed: (){
                    ref.read(selectedTopicProvider.notifier).selectTopic(null);
                  }, 
                  icon: const Icon(Icons.arrow_back)),
                  
              ),
              body: WordList(topicId: selectedTopicId),
              
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
