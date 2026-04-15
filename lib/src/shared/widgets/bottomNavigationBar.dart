import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MyBottomNavigationBar extends ConsumerWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final position = ref.watch(homeTapProvider);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: position,
      elevation: 2,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.outline.withOpacity(0.7),
      backgroundColor: colorScheme.onPrimary,
      selectedLabelStyle: MyTextStyle.poppinsMedium400,
      unselectedLabelStyle: MyTextStyle.poppinsMedium400,
      onTap: (currentIndex) {
        ref.read(homeTapProvider.notifier).state = currentIndex;
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyIcons.bookOpen,
            colorFilter: ColorFilter.mode(
              colorScheme.outline.withOpacity(0.7),
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            MyIcons.bookOpen,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Flashcard',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyIcons.bookCheck,
            colorFilter: ColorFilter.mode(
              colorScheme.outline.withOpacity(0.7),
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            MyIcons.bookCheck,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Topic',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyIcons.quiz,
            colorFilter: ColorFilter.mode(
              colorScheme.outline.withOpacity(0.7),
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            MyIcons.quiz,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            MyIcons.progress,
            colorFilter: ColorFilter.mode(
              colorScheme.outline.withOpacity(0.7),
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            MyIcons.progress,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Progress',
        ),
      ],
    );
  }
}
