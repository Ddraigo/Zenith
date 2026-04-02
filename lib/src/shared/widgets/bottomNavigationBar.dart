import 'package:app_demo/configs/themes/app_colors.dart';
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
      unselectedItemColor: AppColors.iconDark,
      backgroundColor: colorScheme.onPrimary,
      selectedLabelStyle: MyTextStyle.poppinsMedium400,
      unselectedLabelStyle: MyTextStyle.poppinsMedium400,
      onTap: (currentIndex){
        ref.read(homeTapProvider.notifier).state = currentIndex;
        // switch (currentIndex) {
        //   case 0:
        //     context.go(AppRouter.flashcardPath);
        //     break;
        //   case 1:
        //     context.go(AppRouter.topicPath);
        //   case 2:
        //     context.go(AppRouter.testPath);
        //   case 3:
        //     context.go(AppRouter.profilePath);
        //     break;
        //   default:
        // }
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyIcons.bookOpen),
          activeIcon: SvgPicture.asset(
            MyIcons.bookOpen,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Flashcard',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyIcons.bookCheck),
          activeIcon: SvgPicture.asset(
            MyIcons.bookCheck,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Topic',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyIcons.arhive),
          activeIcon: SvgPicture.asset(
            MyIcons.arhive,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Test',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(MyIcons.userIcon),
          activeIcon: SvgPicture.asset(
            MyIcons.userIcon,
            colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
          ),
          label: 'Profile',
        ),
      ],
    );
  }


}


  