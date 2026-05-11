import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/core/provider/shared_flashcard_notifier.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/screen/list_topic.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:app_demo/src/shared/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicSrceen extends ConsumerWidget {
  const TopicSrceen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicAsync = ref.watch(listTopicProvider);
    // final selectedTopicId = ref.watch(selectedTopicProvider);
    return topicAsync.when(
      data: (topics) {
        if (topics.isEmpty) {
          return const Center(child: Text('Không có danh sách'));
        }

        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text('Khám phá từ vựng', style: MyTextStyle.poppinsHeading2,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text('Theo các chủ để dưới đây nào!', style: MyTextStyle.poppinsLarge400,),
              ),
              SizedBox(height: 16.h,),
              Expanded(
                child: ListTopic(
                    onTopicSelected: (topicId) {
                      ref.read(isDailyModeProvider.notifier).state = false;
                      ref.read(selectedTopicProvider.notifier).state = topicId;
                      ref.read(selectedTopicDaily.notifier).state = topicId;
                      ref.read(flashcardIndexProvider.notifier).state = 0;
                      ref.read(homeTapProvider.notifier).state = 0;
                    },
                    topics: topics,
                  
                ),
              ),
            ],
          ),
        );
      },
      error: (error, _) {
        final msg = error is AppException
            ? MyHelper.getErrorMessage(error)
            : 'Đã xảy ra lỗi: $error';
        return Center(child: Text(msg));
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
