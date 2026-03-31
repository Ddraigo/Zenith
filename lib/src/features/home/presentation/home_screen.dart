import 'package:app_demo/src/shared/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../flashcard/presentation/screen/flashcard_screen.dart';
import '../../topic/presentation/screen/topic_srceen.dart';
import '../../profile/presentation/screen/profile_screen.dart';
import '../../quiz/presentation/screen/quiz_screen.dart';

final homeTapProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(homeTapProvider);
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: IndexedStack(
        index: index,
        children: const [
            FlashcardScreen(),
            TopicSrceen(),
            QuizScreen(),
            ProfileScreen(),
          ]
      ),
    );
  }
}
