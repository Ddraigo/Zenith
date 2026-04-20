
import 'dart:developer' as developer;

import 'package:app_demo/src/features/ai_support/data/repository/ai_support_repo.dart';
import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiSupportServiceProvider = Provider(AISupportService.new);

class AISupportService {
  final Ref _ref;
  AISupportService(this._ref);
  late final _repo = _ref.read(aiSupportRepoProvider);

  Future<Either<AppException, AISupportResultModel>> getAISupport({
    required String flashcardId,
  })async{
    if(flashcardId.isEmpty){
      return Either.left(AppException.errorWithMessage('flashcardId is empty'));
    }
    final result = await _repo.getAISupport(flashcardId: flashcardId);
    return result.fold(
      ifLeft: (e){
        developer.log('AISupportService: getAISupport failed', error: e);
        return e.left();
      }, 
      ifRight: (data) => data.right(),
    );
  }

}