
import 'package:app_demo/src/features/topic/presentation/screen/list_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopicSrceen extends ConsumerWidget {
  const TopicSrceen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Topic')),
      ),
      body: const ListTopic(),
    );
  }
}