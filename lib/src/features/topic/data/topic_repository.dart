import 'package:app_demo/src/features/topic/data/topic_dto.dart';
import 'package:app_demo/src/features/topic/data/topic_source.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topicRepositoryProvider = Provider<TopicRepository>((ref) {
  final source = ref.read(topicSourceProvider);
  return TopicRepository(source);
});

class TopicRepository {
  final TopicSource _source;
  TopicRepository(this._source);

  Future<Either<AppException, List<TopicModel>>> getListTopic() async {
    final result = await _source.fetchTopics();

    return result.map((data) => data.map((e) => e.toDomain()).toList());
  }

  Future<Either<AppException, TopicModel>> getTopicById({
    required int id,
  }) async {
    final result = await _source.fetchTopicById(id: id);

    return result.map((data) => data.toDomain());
  }
}
