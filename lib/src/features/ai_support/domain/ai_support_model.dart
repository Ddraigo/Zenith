
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ai_support_model.freezed.dart';
@freezed
abstract class AISupportModel with _$AISupportModel{
  const factory AISupportModel({
        required String flashcardId,
        required Map<String, dynamic> responseJson,
        required int promptVersion,
        required String modelName,
        DateTime? expiresAt,
  }) = _AISupportModel;
}