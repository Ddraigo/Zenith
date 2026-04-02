
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/features/topic/application/topic_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flashcard_topic_list_notifier.g.dart';
@riverpod
class FlashcardTopicListNotifier extends _$FlashcardTopicListNotifier{
  @override
  FutureOr<List<TopicModel>> build(){
    return ref.read(topicServiceProvider).getTopicList();
  }

  Future<void> refresh() async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      ()=> ref.read(topicServiceProvider).getTopicList(),
    );
  }
}