import 'package:app_demo/src/features/ai_support/data/dto/ai_support_response_dto.dart';
import 'package:app_demo/src/features/ai_support/data/source/ai_support_source.dart';
import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiSupportRepoProvider = Provider(
  (ref) => AISupportRepo(ref.read(aiSupportSourceProvider)));

class AISupportRepo {
  final AISupportSource _source;
  AISupportRepo(this._source);

  Future<Either<AppException, AISupportResultModel>> getAISupport({
    required String flashcardId,
  })async{
    final result = await _source.getAISupport(flashcardId: flashcardId);
    return result.map((data) => data.toDomain());
  }
}