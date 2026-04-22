import 'dart:async';

import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:app_demo/src/features/ai_support/presentation/controller/ai_support_notifier.dart';
import 'package:app_demo/src/features/ai_support/presentation/controller/audio_player_provider.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/http/app_exception.dart';
import '../../../../shared/utils/helper_function.dart';
import '../../../../shared/widgets/retry_widget.dart';
import 'componet_ai_content.dart';

class AiSupportBottomSheet extends ConsumerStatefulWidget {
  const AiSupportBottomSheet({
    super.key,
    required this.flashcard,
    this.controller,
  });
  final FlashcardModel flashcard;
  final ScrollController? controller;

  @override
  ConsumerState<AiSupportBottomSheet> createState() =>
      _AiSupportBottomSheetState();
}

class _AiSupportBottomSheetState extends ConsumerState<AiSupportBottomSheet> {
  ProviderSubscription<AsyncValue<AISupportResultModel>>? _aiSupportSub;
  Timer? _pollTimer;
  String get _flashcardId => widget.flashcard.id ?? '';

  @override
  void initState() {
    super.initState();
    _bindAiSupportListener();
  }

  @override
  void didUpdateWidget(covariant AiSupportBottomSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flashcard.id != widget.flashcard.id) {
      _cancelPolling();
      _aiSupportSub?.close();
      _bindAiSupportListener();
    }
  }

  @override
  void dispose() {
    _cancelPolling();
    _aiSupportSub?.close();
    super.dispose();
  }

  void _bindAiSupportListener() {
    _aiSupportSub = ref.listenManual(aISupportProvider(_flashcardId), (
      prev,
      next,
    ) {
      next.whenData((data) {
        final prevSource = prev?.asData?.value.source;
        final nextSource = data.source;
        if (nextSource == 'quota_exceeded') {
          _cancelPolling();
          ref.read(aiQuotaBlockedProvider.notifier).state = true;
          return;
        }
        if (nextSource == 'pending' && prevSource != 'pending') {
          _schedulePolling();
          return;
        }
        _cancelPolling();
      });
    });
  }

  void _cancelPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void _schedulePolling() {
    if (ref.read(aiQuotaBlockedProvider)) return;
    _cancelPolling();
    _pollTimer = Timer(const Duration(seconds: 2), () {
      if (!mounted || ref.read(aiQuotaBlockedProvider)) return;
      ref.invalidate(aISupportProvider(_flashcardId));
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final aiSupportAsycn = ref.watch(aISupportProvider(_flashcardId));

    return SafeArea(
      child: SingleChildScrollView(
        controller: widget.controller,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: aiSupportAsycn.when(
          data: (aiSupportData) {
            if (aiSupportData.source == 'quota_exceeded') {
              _cancelPolling();
              return RetryWidget(
                msg: 'Hiện đã hết lượt gọi AI, vui lòng thử lại sau',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'AI đang tạm hết quota, vui lòng thử lại sau',
                      ),
                    ),
                  );
                },
              );
            }

            final data = aiSupportData.data;
            final player = ref.watch(audioPlayerProvider);
            return Column(
              spacing: 16.h,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                word(color, widget.flashcard),
                if (aiSupportData.phonetic!.isNotEmpty)
                  audioButton(
                    color,
                    aiSupportData.phonetic ?? 'N/A',
                    onPressed: () async {
                      if (aiSupportData.audioUs!.isEmpty) return;
                      await player.setUrl(aiSupportData.audioUs ?? '');
                      player.play();
                    },
                  ),
                if (data.easyMeaning.isNotEmpty)
                  wordMeaning(color, data.easyMeaning),
                if (data.whenToUse.isNotEmpty) whenToUse(color, data),
                if (data.examples.isNotEmpty) exmaple(data.examples, color),
                if (data.commonPhrases.isNotEmpty)
                  commonPhrases(color, data.commonPhrases),
                if (data.synonyms.isNotEmpty) synonyms(color, data.synonyms),
                if (data.antonyms != null && data.antonyms!.isNotEmpty)
                  antonyms(data, color),
                if (data.memoryTip != null && data.memoryTip!.isNotEmpty)
                  menoryTip(color, data.memoryTip ?? 'N/A'),
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
              onPressed: ref.read(aiQuotaBlockedProvider)
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Hiện đã hết lượt gọi AI, vui lòng thử lại sau',
                          ),
                        ),
                      );
                    }
                  : () => ref
                        .read(aISupportProvider(_flashcardId).notifier)
                        .refresh(_flashcardId),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
