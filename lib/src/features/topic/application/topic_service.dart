
import 'dart:developer' as developer;

import 'package:app_demo/src/features/topic/data/topic_repository.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topicServiceProvider = Provider(TopicService.new);

/// Application Layer - xử lý business logic, convert Either → Result
/// Nhiệm vụ:
/// - Gọi repository không trực tiếp xử lý Either
/// - Có thể combine nhiều repository calls
/// - Throw exception nếu cần (Presentation layer sẽ wrap vào AsyncValue)
class TopicService {
  final Ref _ref;
  TopicService(this._ref);

  late final _topicRepo = _ref.read(topicRepositoryProvider);

  /// Fetch danh sách topics, throw exception nếu lỗi
  /// Presentation layer sẽ catch via AsyncValue.guard()
  Future<List<TopicModel>> getTopicList() async {
    final result = await _topicRepo.getListTopic();
    
    return result.fold(
      ifLeft: (error) {
        developer.log('TopicService: Error fetching topics', 
            error: error,
            stackTrace: StackTrace.current);
        throw error;
      },
      ifRight: (topics) => topics,
    );
  }

  /// Fetch topic theo ID
  Future<TopicModel> getTopicById(int id) async {
    final result = await _topicRepo.getTopicById(id: id);
    
    return result.fold(
      ifLeft: (error) {
        developer.log('TopicService: Error fetching topic by id: $id', 
            error: error);
        throw error;
      },
      ifRight: (topic) => topic,
    );
  }
}