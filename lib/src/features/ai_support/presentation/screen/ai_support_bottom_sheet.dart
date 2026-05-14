import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:app_demo/src/features/ai_support/presentation/controller/ai_support_notifier.dart';
import 'package:app_demo/src/features/ai_support/presentation/controller/audio_player_provider.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/widgets/retry_widget.dart';
import 'componet_ai_content.dart';

class AiSupportBottomSheet extends ConsumerWidget {
  const AiSupportBottomSheet({
    super.key,
    required this.flashcard,
    this.controller,
  });
  final FlashcardModel flashcard;
  final ScrollController? controller;
  String get _flashcardId => flashcard.id ?? '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;

    // Watch with select to reduce rebuilds - only trigger on source/data changes, not metadata
    final aiSupportAsycn = ref.watch(aISupportProvider(_flashcardId));
    
    return SafeArea(
      child: SingleChildScrollView(
        controller: controller,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: aiSupportAsycn.when(
          data: (aiSupportData) {
            if (aiSupportData.source == TypeSource.quotaExceeded) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: Text(
                    'Hiện đã hết lượt gọi AI, vui lòng thử lại sau 24h',
                    style: MyTextStyle.poppinsMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            if (aiSupportData.source == TypeSource.pending) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: Text(
                    'Vui lòng chờ trong giây lát',
                    style: MyTextStyle.poppinsMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            if (aiSupportData.source == TypeSource.failed) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Center(
                  child: RetryWidget(
                    msg: 'AI xử lý thất bại',
                    onPressed: () {
                      // Guard: only retry if not already pending/loading
                      final currentSource = aiSupportAsycn.maybeWhen(
                        data: (data) => data.source,
                        orElse: () => null,
                      );
                      if (currentSource != TypeSource.pending && currentSource != TypeSource.failed) {
                        return;
                      }
                      ref.read(aISupportProvider(_flashcardId).notifier).refresh(_flashcardId);
                    },
                  ),
                ),
              );
            }

            final data = aiSupportData.data;
            final audioController = ref.watch(audioPlayerControllerProvider);
            return Column(
              spacing: 16.h,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                word(color, flashcard),
                if (aiSupportData.phonetic.isNotEmpty)
                  audioButton(
                    color,
                    aiSupportData.phonetic,
                    onPressed: () async {
                      if (aiSupportData.audioUs.isEmpty){
                        Fluttertoast.showToast(
                          timeInSecForIosWeb: 3,
                          msg: 'Rất tiếc, hiện tại chưa có sẵn audio',
                          textColor: Colors.white,
                          backgroundColor: Colors.deepOrange.shade400, 
                          gravity: ToastGravity.TOP,
                        );
                      return;
                      } 
                      await audioController.playUrl(aiSupportData.audioUs);
                    },
                  ),
                if (data.easyMeaning.isNotEmpty)
                  wordMeaning(color, data.easyMeaning),
                if (data.whenToUse.isNotEmpty) whenToUse(color, data),
                if (data.examples.isNotEmpty) example(data.examples, color),
                if (data.commonPhrases.isNotEmpty)
                  commonPhrases(color, data.commonPhrases),
                if (data.synonyms.isNotEmpty) synonyms(color, data.synonyms),
                if (data.antonyms.isNotEmpty) antonyms(data, color),
                if (data.memoryTip.isNotEmpty) memoryTip(color, data.memoryTip),
                SizedBox(height: 2.h),
              ],
            );
          },
          error: (error, _) {
            final msg = error is AppException
                ? MyHelper.getErrorMessage(error)
                : 'Đã xảy ra lỗi';

            return RetryWidget(
              msg: msg,
              onPressed: () {
                if (!aiSupportAsycn.isLoading && !aiSupportAsycn.isRefreshing) {
                  ref.read(aISupportProvider(_flashcardId).notifier).refresh(_flashcardId);
                }
              },
            );
          },
          loading: () => SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
