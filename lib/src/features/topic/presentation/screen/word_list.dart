
import 'package:app_demo/src/features/topic/presentation/controller/word_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WordList extends ConsumerWidget {
  const WordList({super.key, required this.topicId});
  final int topicId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flashcardAsync = ref.watch(wordListProvider(topicId));

    return flashcardAsync.when(
      data: (flashcards){
        if(flashcards.isEmpty){
          return const Center(child: Text('Không tìm thấy dữ liệu'),);
        }
        return ListView.builder(
          itemCount:  flashcards.length,
          itemBuilder: (context, index){
            final word = flashcards[index];
            return Card(
              child: ListTile(
                title: Text(word.word),
                subtitle: Text(word.meaning),
              ),
            );
          }
        );
      }, 
      error: (e, _) => Center(child: Text('Lỗi: $e'),), 
      loading: () => Center(child: CircularProgressIndicator(),
      )
    );
  }
}