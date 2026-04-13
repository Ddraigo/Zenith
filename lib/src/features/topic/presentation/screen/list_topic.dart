import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../controller/topic_flashcard_notifier.dart';



class ListTopic extends ConsumerWidget {
  const ListTopic({super.key, this.onTopicSelected, required this.topics});
  final Function(int topicId)? onTopicSelected;
  final List<TopicModel> topics;
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    
    if (topics.isEmpty) {
      return const Center(child: Text('Không tìm thấy danh sách chủ đề nào'));
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
        final numWord = ref.watch(getFlashcardCountByTopicProvider(topic.id));
        final wordCountText = numWord.when(
          data: (count) => '$count từ',
          loading: () => '... từ',
          error: (_, _) => '0 từ',
        );
        
        return GestureDetector(
          onTap: () => onTopicSelected?.call(topic.id),
          child: Card(
            color: colorScheme.onTertiary,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(40.r),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  
                  child: SvgPicture.asset(
                    MyIcons.learn,
                    colorFilter: ColorFilter.mode(
                      colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  topic.name,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.poppinsLarge600,
                ),
                Text(wordCountText, style: MyTextStyle.poppinsMedium400),
              ],
            ),
          ),
        );
      },
    );
  }
}
