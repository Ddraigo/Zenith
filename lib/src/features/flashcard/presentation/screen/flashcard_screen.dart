import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/shared_flashcard_notifier.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/daily_word_bottom_sheet.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_list.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../configs/routes/app_router.dart';
import '../../../../core/provider/current_user_id_notifire.dart';
import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/widgets/my_avatar.dart';

class FlashcardScreen extends ConsumerWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final currentIndex = ref.watch(flashcardIndexProvider);
    final topicAsync = ref.watch(listTopicProvider);

    final selectedTopicId = ref.watch(selectedTopicProvider) ?? 0;
    final flashcardAsync = ref.watch(getFlashcardsProvider(selectedTopicId));

    final userName = ref.watch(userNameProvider);
    final avatarUrl = ref.watch(userAvatarProvider.select((a) => a.maybeWhen(
      data: (url) => url,
      orElse: () => '',
    )));

    final getTopicName = topicAsync.maybeWhen(
      data: (topics) {
        if (flashcardAsync.hasValue) {
          final flashcards = flashcardAsync.value ?? [];
          if (flashcards.isNotEmpty) {
            final topicId = flashcards.first.topicId;
            for (final topic in topics) {
              if (topic.id == topicId) {
                return topic.name;
              }
            }
          }
        }
        return 'N/A';
      },
      orElse: () => 'Lỗi: N/A',
    );

    return flashcardAsync.when(
      data: (defaultFlashcards) {
        final getIndex = currentIndex.clamp(
          0,
          defaultFlashcards.isEmpty ? 0 : defaultFlashcards.length - 1,
        );

        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorScheme.onPrimary,
            toolbarHeight: 75.h,
            titleSpacing: 0,
            leadingWidth: 200.w,
            leading: Container(
              margin: EdgeInsets.only(left: 16.w),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                spacing: 8.w,
                children: [
                  MyAvatar(
                    userAvatar: avatarUrl,
                    size: 35.r,
                    onTap: () => context.push(AppRouter.settingPath),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Xin chào', style: MyTextStyle.poppinsMedium),
                      Text(userName, style: MyTextStyle.poppinsLarge600),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsGeometry.only(right: 16.w),
                child: Row(
                  children: [
                    _dailyListButoon(context, ref, colorScheme),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Badge.count(
                    //     count: 2,
                    //     // padding: EdgeInsetsDirectional.all(1.r),
                    //     child: SvgPicture.asset(
                    //       MyIcons.bell,
                    //       colorFilter: ColorFilter.mode(
                    //         colorScheme.primary,
                    //         BlendMode.srcIn,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(0, 8.h, 0, 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text('Chủ đề', style: MyTextStyle.poppinsMedium,),
                ),
                SizedBox(height: 8.h,),
                topicAsync.when(
                  data: (topics) {
                    return SizedBox(
                      height: 50.h,
                      child: _topicList(
                        context,
                        topics,
                        colorScheme,
                        onTopicSelected: (topicId) {
                          ref.read(isDailyModeProvider.notifier).state = false;
                          ref.read(selectedTopicProvider.notifier).state =
                              topicId;
                          ref.read(selectedTopicDaily.notifier).state = topicId;
                          ref.read(flashcardIndexProvider.notifier).state = 0;
                        },
                      ),
                    );
                  },
                  error: (error, _) {
                    final msg = error is AppException
                        ? MyHelper.getErrorMessage(error)
                        : 'Đã xảy ra lỗi';
                    return Placeholder(
                      child: SizedBox(
                        height: 100.h,
                        width: double.maxFinite,
                        child: Text(msg),
                      ),
                    );
                  },
                  loading: () => Placeholder(),
                ),

                SizedBox(height: 16),
                _todayProgress(
                  colorScheme,
                  getTopicName.isEmpty ? 'N/A' : getTopicName,
                  defaultFlashcards.isEmpty ? 0 : getIndex + 1,
                  defaultFlashcards.isEmpty ? 0 : defaultFlashcards.length,
                ),
                SizedBox(height: 16),
                if (defaultFlashcards.isEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _flashcardEmpty(colorScheme),
                  )
                else
                  Expanded(
                    child: FlashcardList(
                      flashcards: defaultFlashcards,
                      onSwiped: (index) {
                        ref.read(flashcardIndexProvider.notifier).state = index;
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
      error: (error, _) {
        final msg = error is AppException
            ? MyHelper.getErrorMessage(error)
            : 'Đã xảy ra lỗi';
        return Center(child: Text(msg));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _flashcardEmpty(ColorScheme colorScheme) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.r),
        ),
        elevation: 0,
        color: colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(30.r),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Không có từ vựng nào',
                  textAlign: TextAlign.center,
                  style: MyTextStyle.poppinsHeading2.copyWith(
                    fontSize: 40.sp,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 52.h),
              Text(
                'Quay lại sau',
                style: MyTextStyle.poppinsMedium400.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topicList(
    BuildContext context,
    List<TopicModel> topicList,
    ColorScheme color, {
    final Function(int topicId)? onTopicSelected,
  }) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: topicList.length,
      itemBuilder: (context, index) {
        final topic = topicList[index];
        return Padding(
          
          padding: EdgeInsets.only(right: index == topicList.length -1 ? 0 : 8.w),
          child: ElevatedButton.icon(
            onPressed: () => onTopicSelected?.call(topic.id),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              backgroundColor: color.primary.withValues(alpha: 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(color: color.primary.withValues(alpha: 0.5)),
              ),
            ),
            label: Text(
              topic.name,
              style: MyTextStyle.poppinsMedium.copyWith(color: color.primary),
            ),
            icon: topic.icon.isEmpty
                ? SvgPicture.asset(
                    MyIcons.learn,
                    colorFilter: ColorFilter.mode(
                      color.primary,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                    height: 24.h,
                    width: 24.h,
                  )
                : SvgPicture.string(
                    topic.icon,
                    colorFilter: ColorFilter.mode(
                      color.primary,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                    height: 24.h,
                    width: 24.h,
                  ),
          ),
        );
      },
    );
  }

  Widget _todayProgress(
    ColorScheme color,
    String topicName,
    int currentIndex,
    int total,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: color.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CHỦ ĐỀ HÔM NAY',
                style: MyTextStyle.poppinsLarge400.copyWith(
                  color: color.outline,
                ),
              ),
              Text(
                'SỐ TỪ',
                style: MyTextStyle.poppinsLarge400.copyWith(
                  color: color.outline,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(topicName, style: MyTextStyle.poppinsLarge600),
              Row(
                spacing: 4,
                children: [
                  Text(
                    '$currentIndex/$total',
                    style: MyTextStyle.poppinsLarge600.copyWith(
                      color: color.primary,
                    ),
                  ),
                  // Text('từ', style: MyTextStyle.poppinsLarge600),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: LinearProgressIndicator(
              minHeight: 16.h,
              backgroundColor: color.outline.withValues(alpha: 0.4),
              value: total > 0 ? currentIndex / total : 0,
              valueColor: AlwaysStoppedAnimation<Color>(color.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dailyListButoon(
    BuildContext context,
    WidgetRef ref,
    ColorScheme color,
  ) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          useSafeArea: true,
          backgroundColor: color.onPrimary,
          builder: (_) => const DailyWordBottomSheet(),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color.onInverseSurface,
        fixedSize: Size(30.w, 30.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      icon: SvgPicture.asset(
        MyIcons.calendar,
        colorFilter: ColorFilter.mode(color.error, BlendMode.srcIn),
      ),
    );
  }
}
