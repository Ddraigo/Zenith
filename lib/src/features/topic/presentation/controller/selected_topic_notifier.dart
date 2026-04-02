import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'selected_topic_notifier.g.dart';
@riverpod
class SelectedTopicNotifier extends _$SelectedTopicNotifier{
  @override
  int? build(){
    return null;
  }

  void selectTopic(int? topicId){
    state = topicId;
  }
}