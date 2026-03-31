
import 'package:app_demo/src/features/topic/data/topic_repository.dart';
import 'package:app_demo/src/features/topic/domain/topic_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topicServiceProvide = Provider(TopicService.new);

class TopicService {
  final Ref _ref;
  TopicService(this._ref);

  late final TopicRepository _repo = _ref.read(topicRepositoryProvider);



}