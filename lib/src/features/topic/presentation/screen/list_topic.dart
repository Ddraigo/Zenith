import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ListTopic extends ConsumerWidget {
  const ListTopic({super.key, this.onTopicSelected, required this.topics});
  final Function(int topicId)? onTopicSelected;
  final List<TopicModel> topics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    if (topics.isEmpty) {
      return const Center(child: Text('Không tìm thấy danh sách nào'));
    }
    return GridView.builder(
      padding: EdgeInsets.all(16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 1,
      ),
      itemCount: topics.length,
      itemBuilder: (context, index) {
        final topic = topics[index];

        return GestureDetector(
          onTap: () => onTopicSelected?.call(topic.id),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16.r),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  MyIcons.learn,
                  colorFilter: ColorFilter.mode(
                    colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  topic.name,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.poppinsMedium600,
                ),
                Text('120 Từ', style: MyTextStyle.poppinsMedium400),
              ],
            ),
          ),
        );
      },
    );
  }
}
