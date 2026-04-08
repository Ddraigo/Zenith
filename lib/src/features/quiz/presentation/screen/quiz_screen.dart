import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Quiz'),
          )),
        ],
      )
    );
  }
}