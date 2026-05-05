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
      unselectedItemColor: colorScheme.outline,
      backgroundColor: colorScheme.onPrimary,
      selectedLabelStyle: MyTextStyle.poppinsMedium400,
      unselectedLabelStyle: MyTextStyle.poppinsMedium400,
      onTap: (currentIndex) {
        ref.read(homeTapProvider.notifier).state = currentIndex;
      },
      items: [
        _buildItem(
          colorScheme: colorScheme,
          iconPath: MyIcons.bookOpen,
          label: "Flashcard",
          index: 0,
          position: position,
        ),
        _buildItem(
          colorScheme: colorScheme,
          iconPath: MyIcons.bookCheck,
          label: "Chủ đề",
          index: 1,
          position: position,
        ),
        _buildItem(
          colorScheme: colorScheme,
          iconPath: MyIcons.quiz,
          label: "Quiz",
          index: 2,
          position: position,
        ),
        _buildItem(
          colorScheme: colorScheme,
          iconPath: MyIcons.progress,
          label: "Lịch sử",
          index: 3,
          position: position,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildItem({
    required ColorScheme colorScheme,
    required String iconPath,
    required int index,
    required int position,
    required String label,
  }) {
    final isSelected = position == index;
    final color = isSelected ? colorScheme.primary : colorScheme.outline;
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),

      label: label,
    );
  }
}
