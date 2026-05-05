import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/provider/current_user_id_notifire.dart';
import '../../profile/presentation/controller/profile_notifier.dart';
import '../../../shared/widgets/my_avatar.dart';
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
    final profileAsync = ref.watch(profileProvider);
    final avatarUrl = profileAsync.maybeWhen(
      data: (profile) => profile.avatarUrl ?? '',
      orElse: () => '',
    );
    final displayName = ref.watch(userEmailProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black12,
        backgroundColor: color.onPrimary,
        toolbarHeight: 70.h,
        titleSpacing: 0,
        leadingWidth: 70.w,
        leading: Container(
          margin: EdgeInsets.only(left: 16.w),
          child: MyAvatar(
            userAvatar: avatarUrl,
            displayName: displayName,
            size: 40.r,
            onTap: () => context.push(AppRouter.profilePath),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsetsGeometry.only(right: 16.w, top: 12.h),
        //     child: IconButton(
        //       onPressed: () {},
        //       icon: Badge.count(
        //         count: 2,
        //         // padding: EdgeInsetsDirectional.all(1.r),
        //         child: SvgPicture.asset(
        //           MyIcons.bell,
        //           colorFilter: ColorFilter.mode(color.primary, BlendMode.srcIn),
        //         ),
        //       ),
        //     ),
        //   ),
        // ],
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

