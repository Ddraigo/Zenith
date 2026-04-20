
import 'package:app_demo/src/features/ai_support/application/ai_support_service.dart';
import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ai_support_notifier.g.dart';
@riverpod
class AISupportNotifier extends _$AISupportNotifier{
  
  @override
  Future<AISupportResultModel> build(String flashcardId)async{
    return _loadData(flashcardId);

  }

  Future<AISupportResultModel>_loadData(String flashcardId)async{
    final result = await ref.read(aiSupportServiceProvider).getAISupport(flashcardId: flashcardId);
    return result.fold(
      ifLeft: (e) => throw e, 
      ifRight: (data) => data,
    );
  }

  Future<void> refresh(String flashcardId) async{
    state = await AsyncValue.guard(
      () => _loadData(flashcardId),
    );
  }
}