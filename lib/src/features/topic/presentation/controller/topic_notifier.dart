
import 'package:app_demo/src/features/topic/data/topic_repository.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:dart_either/dart_either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'topic_notifier.g.dart';

@riverpod
class TopicNotifier extends _$TopicNotifier{

  FutureOr<List<TopicModel>> build() async{
    return _fetchTopics();
  } 

  Future<List<TopicModel>> _fetchTopics() async{
    final topicList = await ref.read(topicRepositoryProvider).getListTopic();
    return topicList.getOrThrow();
  } 

  Future<void> refresh() async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchTopics());
  }

}