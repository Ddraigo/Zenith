import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        actions: [
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Badge(
              child: IconButton(
                padding: EdgeInsets.all(5.r),
                onPressed: () {},
                icon: SvgPicture.asset(
                  MyIcons.bell,
                  colorFilter: ColorFilter.mode(color.primary, BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: IndexedStack(
        index: index,
        children: const [
          FlashcardScreen(),
          TopicSrceen(),
          QuizScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
