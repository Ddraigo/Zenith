import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../flashcard/presentation/screen/flashcard_screen.dart';
import '../../statistics/presentation/screen/statistics_screen.dart';
import '../../topic/presentation/screen/topic_srceen.dart';
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
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        elevation: 1,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.only(right: 16.w, top: 12.h),
            child: IconButton(
              onPressed: () {},
              icon: Badge(
                padding: EdgeInsetsDirectional.only(bottom: 10.h),
                child: SvgPicture.asset(
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
          StatisticsScreen(),
        ],
      ),
    );
  }
}
