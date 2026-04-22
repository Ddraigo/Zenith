
import 'dart:async';

import 'package:app_demo/src/features/ai_support/application/ai_support_service.dart';
import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/utils/validator.dart';
part 'ai_support_notifier.g.dart';

final aiQuotaBlockedProvider = StateProvider<bool>((ref) => false);

@riverpod
class AISupportNotifier extends _$AISupportNotifier{
  Timer? _quotaResetTimer;


  void _blockQuotaTemporarily() {
    ref.read(aiQuotaBlockedProvider.notifier).state = true;
    _quotaResetTimer?.cancel();
    _quotaResetTimer = Timer(const Duration(minutes: 1), () {
      ref.read(aiQuotaBlockedProvider.notifier).state = false;
    });
  }
  
  @override
  Future<AISupportResultModel> build(String flashcardId)async{
    ref.onDispose(() {
      _quotaResetTimer?.cancel();
    });
    return _loadData(flashcardId);

  }
  Future<AISupportResultModel>_loadData(String flashcardId)async{
    final result = await ref.read(aiSupportServiceProvider).getAISupport(flashcardId: flashcardId);
    return result.fold(
      ifLeft: (e) {
        
        if (Validator.isQuotaMessage(e.toString())) {
          _blockQuotaTemporarily();
        }
        throw e;
      }, 
      ifRight: (data){
        if(data.source == 'quota_exceeded'){
          _blockQuotaTemporarily();
        }
        return data;
      },
    );
  }

  Future<void> refresh(String flashcardId) async{
    state = await AsyncValue.guard(
      () => _loadData(flashcardId),
    );
  }
}