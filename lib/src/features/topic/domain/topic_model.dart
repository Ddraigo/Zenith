
import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic_model.freezed.dart';

@freezed
abstract class TopicModel with _$TopicModel{
  const factory TopicModel({
    required int id,
    required String name,
    DateTime? createdAt,
  }) = _TopicModel;

}