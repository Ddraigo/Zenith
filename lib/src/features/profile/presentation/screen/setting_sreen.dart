import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/profile/presentation/controller/setting_notifier.dart';
import 'package:app_demo/src/shared/utils/logout_utils.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/my_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/widgets/switch_button.dart';
import 'change_password_dialog.dart';

class SettingSreen extends ConsumerWidget {
  const SettingSreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    final notificationStatus = ref.watch(pushNotificationProvider);
    final darkModeStatus = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton.icon(
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            label: Text(
              'Đăng xuất',
              style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
            ),
            icon: SvgPicture.asset(MyIcons.logout, width: 40.w, height: 40.h),
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.r),
          child: Column(
            spacing: 8.h,
            children: [
              _profile(color, ref, context),
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

  Widget _profile(ColorScheme color, WidgetRef ref, BuildContext context) {
    final profileAsync = ref.watch(profileProvider);
    final userEmail = ref.watch(userEmailProvider);
    return profileAsync.maybeWhen(
      data: (profile) {
        return GestureDetector(
          onTap: () => context.push(AppRouter.profilePath),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16.r),
              color: color.onTertiary,
            ),
            child: Row(
              spacing: 8.w,
              children: [
                MyAvatar(userAvatar: profile.avatarUrl ?? '', size: 25.r),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 1.h,
                    children: [
                      Text(
                        profile.userName,
                        style: MyTextStyle.poppinsLarge600.copyWith(
                          color: color.inverseSurface,
                        ),
                      ),
                      Text(
                        userEmail,
                        style: MyTextStyle.poppinsMedium.copyWith(
                          color: color.outline.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: color.outline.withValues(alpha: 0.5),
                  size: 20.r,
                ),
              ],
            ),
          ),
        );
      },
      orElse: () => SizedBox.shrink(),
    );
  }

  Widget _account(ColorScheme color, WidgetRef ref, BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Tài khoản',
        //   style: MyTextStyle.poppinsLarge400.copyWith(
        //     color: color.outline.withValues(alpha: 0.8),
        //   ),
        // ),
        _buttonAction(
          onPressed: () => _showChangePasswordDialog(context, ref, color),
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: color.onTertiary,
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Cài đặt chung',
          //   style: MyTextStyle.poppinsLarge400.copyWith(
          //     color: color.outline.withValues(alpha: 0.8),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(16.r),
            //   color: color.onTertiary,
            // ),
            child: Row(
              spacing: 8.w,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.primary.withValues(alpha: 0.05),
                  ),
                  child: Icon(Icons.notifications_active_outlined, color: color.primary,),
                ),
                Expanded(
                  child: Text(
                    'Thông báo',
                    style: MyTextStyle.poppinsMedium.copyWith(fontSize: 18.sp),
                  ),
                ),
                SwitchButton(
                  value: notificationStatus,
                  onChanged: (newValue) {
                    ref.read(pushNotificationProvider.notifier).state =
                        newValue;
                  },
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.5,
            color: color.outline.withValues(alpha: 0.5),
            radius: BorderRadius.circular(2.r),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w,),
            child: Row(
              spacing: 8.w,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.primary.withValues(alpha: 0.05),
                  ),
                  child: Icon(Icons.dark_mode_outlined, color: color.primary,),
                ),
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
      ),
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
        backgroundColor: color.onTertiary,
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
            color: color.outline.withValues(alpha: 0.5),
            size: 20,
          ),
        ],
      ),
    );
  }

  Future<void> _showChangePasswordDialog(
    BuildContext context,
    WidgetRef ref,
    ColorScheme color,
  ) async {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) =>
          ChangePasswordDialog(parentContext: context, color: color),
    );
  }
}
