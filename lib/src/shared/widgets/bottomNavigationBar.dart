// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';

// class MyBottomNavigationBar extends StatelessWidget {
//   const MyBottomNavigationBar({
//     super.key,
//     required this.colorScheme,
//   });

//   final ColorScheme colorScheme;

//   @override
//   MyBottomNavigationBar build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: 0,
//       elevation: 1,
//       selectedItemColor: colorScheme.onPrimary,
//       unselectedItemColor: colorScheme.primary,
//       backgroundColor: colorScheme.onPrimary,
//       onTap: (currentIndex){
//         switch (currentIndex) {
//           case 1:
//             context.go(AppRouter.homePath);
//             break;
//           case 2:
//           case 3:
//           case 4:
//             context.go(AppRouter.profilePath);
//             break;
//           default:
//         }
//       },
//       items: [
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(MyIcons.home),
//           activeIcon: SvgPicture.asset(
//             MyIcons.home,
//             colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(MyIcons.bookOpen),
//           activeIcon: SvgPicture.asset(
//             MyIcons.bookOpen,
//             colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(MyIcons.arhive),
//           activeIcon: SvgPicture.asset(
//             MyIcons.arhive,
//             colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(MyIcons.userIcon),
//           activeIcon: SvgPicture.asset(
//             MyIcons.userIcon,
//             colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
//           ),
//         ),
//       ],
//     );
//   }
// }