import 'dart:math';

import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/ai_support/domain/flashcard_ai_support_model.dart';
import 'package:app_demo/src/features/ai_support/presentation/controller/ai_support_notifier.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiSupportBottomSheet extends ConsumerWidget {
  const AiSupportBottomSheet({super.key, required this.flashcard});
  final FlashcardModel flashcard;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;

    final aiSupportAsycn = ref.watch(aISupportProvider(flashcard.id ?? ''));

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(48)),
        ),
        child: aiSupportAsycn.when(
          data: (aiSupportData) {
            final data = aiSupportData.data;
            return Column(
              spacing: 8.h,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _word(color),
                _audioButton(color, data),
                Column(
                  children: [
                    Expanded(
                      child: Text('Nghĩa dễ hiểu', style: MyTextStyle.poppinsMedium600),
                    ),
                    _wordMeaning(data.easyMeaning),
                  ],
                ),
                Column(
                  children: [
                    Text('Khi nào dùng', style: MyTextStyle.poppinsMedium600),
                    SizedBox(height: 8.h,),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.whenToUse.length,
                      itemBuilder: (context, index){
                        final item = data.whenToUse[index];
                        _whenToUse(color, item);
                      }
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Ví dụ thực tế', style: MyTextStyle.poppinsMedium600),
                    SizedBox(height: 8.h,),
                    
                  ],
                ),
              ],
            );
          },
          error: (e, _) => Center(child: Text('Lỗi: $e')),
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Container _whenToUse(ColorScheme color, String whenToUse) {
    return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        spacing: 8.w,
                        children: [
                          Container(
                            height: 5.h,
                            width: 5.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color.primary,
                            ),
                          ),
                          Text(whenToUse, style: MyTextStyle.poppinsMedium,),
                        ],
                      ),
                    );
  }

  Widget _wordMeaning(String meaning) {
    return Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(meaning, style: MyTextStyle.poppinsMedium),
        );
  }

  Widget _audioButton(ColorScheme color, FlashcardAiSupportModel data) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 5.h),
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
      icon: Icon(Icons.volume_up_outlined, color: color.primary),
      label: Text(data.phonetic ?? 'N/A', style: MyTextStyle.poppinsMedium600),
    );
  }

  Widget _word(ColorScheme color) {
    return Row(
      spacing: 8.w,
      children: [
        Text(
          flashcard.word,
          style: MyTextStyle.poppinsLarge400.copyWith(color: color.primary),
        ),
        Text(
          flashcard.partOfSpeech ?? 'N/A',
          style: MyTextStyle.poppinsSmall.copyWith(color: Colors.black45),
        ),

        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        //   decoration: BoxDecoration(
        //     color: color.outline.withValues(alpha: 0.3),
        //     borderRadius: BorderRadius.circular(20.r),
        //   ),
        //   child: Text(flashcard.partOfSpeech ?? 'N/A', style: MyTextStyle.poppinsSmall.copyWith(color: Colors.black45),),
        // )
      ],
    );
  }
}
