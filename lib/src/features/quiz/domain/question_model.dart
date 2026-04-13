import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_model.freezed.dart';



@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int topicId,
    required List<QuestionItem> questions,
    required Map<String, String> userAnswers,
  }) = _QuestionModel;
}

@freezed
abstract class QuestionItem with _$QuestionItem {
  const factory QuestionItem({
    required String flashcardId,
    required String question,
    required String correctAnswer,
  }) = _QuestionItem;
}

extension QuestionModelEx on QuestionModel{
  QuestionModel updateAnswer({
  required String flashcardId,
  required String answer,
}) {
  final current = userAnswers;
  return copyWith(
    userAnswers: {...current, flashcardId: answer.trim()},
  );
}
}

