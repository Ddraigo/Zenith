import 'package:app_demo/src/features/topic/presentation/controller/topic_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListTopic extends ConsumerWidget {
  const ListTopic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicAsync = ref.watch(topicProvider);
    return topicAsync.when(
      data: (topics){
        return ListView.builder(
          itemCount: topics.length,
          itemBuilder: (context, index){
            final topic = topics[index];
            return Card(
              child: ListTile(
                title: Text(topic.name),
              ),
            );
            
          }
        );
      }, 
      error: (e,_) => Center(child: Text(e.toString()),), 
      loading: ()=> const Center(child: CircularProgressIndicator(),));
  }
}