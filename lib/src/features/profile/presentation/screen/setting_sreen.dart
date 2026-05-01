import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/profile/presentation/controller/setting_notifier.dart';
import 'package:app_demo/src/shared/utils/logout_utils.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/switch_button.dart';

class SettingSreen extends ConsumerWidget {
  const SettingSreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    // final notificationStatus = ref.watch(pushNotificationProvider);
    // final darkModeStatus = ref.watch(darkModeProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.black26,
          backgroundColor: color.onPrimary,
          toolbarHeight: 70.h,
          titleSpacing: 0,
          centerTitle: true,
          title: Text('Cài đặt'),
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 16.h),
            padding: EdgeInsets.symmetric( horizontal: 16.w),
            child: ElevatedButton(
              onPressed: () {
                ref.read(settingProvider.notifier).logout();
                if (context.mounted) {
                  invalidateUserSessionProviders(ref);
                  context.go(AppRouter.loginPath);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color.onPrimary,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              ),
              child: Row(
                spacing: 10.w,
                children: [
                  SvgPicture.asset(MyIcons.logout, width: 40.w, height: 40.h),
                  Expanded(
                    child: Text(
                      'Đăng xuất',
                      style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // _buttonAction(
        //     onPressed: (){
        //       ref.read(settingProvider.notifier).logout();
        //       if(context.mounted){
        //         ref.invalidate(currentUserIdProvider);
        //         context.go(AppRouter.loginPath);
        //       }
        //     },
        //     color: color,
        //     label: 'Đăng xuất',
        //     iconPath: MyIcons.logout,
        //   ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 8.h,
            children: [
              _account(color, ref, context),
              SizedBox(height: 8.h),
              // _general(
              //   color: color,
              //   ref: ref,
              //   notificationStatus: notificationStatus,
              //   darkModeStatus: darkModeStatus,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _account(ColorScheme color, WidgetRef ref, BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tài khoản',
          style: MyTextStyle.poppinsLarge400.copyWith(
            color: color.outline.withValues(alpha: 0.8),
          ),
        ),

        _buttonAction(
          onPressed: () {},
          color: color,
          label: 'Đổi mật khẩu',
          iconPath: MyIcons.changePassword,
        ),
      ],
    );
  }

  Widget _general({
    required ColorScheme color,
    required WidgetRef ref,
    required bool notificationStatus,
    required bool darkModeStatus,
  }) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cài đặt chung',
          style: MyTextStyle.poppinsLarge400.copyWith(
            color: color.outline.withValues(alpha: 0.8),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: color.onPrimary,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Thông báo',
                  style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                ),
              ),
              SwitchButton(
                value: notificationStatus,
                onChanged: (newValue) {
                  ref.read(pushNotificationProvider.notifier).state = newValue;
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: color.onPrimary,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Chế độ',
                  style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                ),
              ),
              SwitchButton(
                value: darkModeStatus,

                onChanged: (newValue) {
                  ref.read(darkModeProvider.notifier).state = newValue;
                },
                iconOn: Icons.dark_mode_outlined,
                iconOff: Icons.light_mode_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonAction({
    required ColorScheme color,
    required String label,
    required String iconPath,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.onPrimary,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          SvgPicture.asset(iconPath, width: 40.w, height: 40.h),
          Expanded(
            child: Text(
              label,
              style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: color.secondary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
