

import 'package:app_demo/src/features/flashcard/data/dto/user_daily_word_dto.dart';
import 'package:app_demo/src/features/flashcard/data/source/user_daily_word_source.dart';
import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:dart_either/dart_either.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDailyWordRepoProvider = 
  Provider<UserDailyWordRepository>((ref) => UserDailyWordRepository(ref.read(userDailyWordSourceProvider)));

class UserDailyWordRepository {
  final UserDailyWordSource _source;
  UserDailyWordRepository(this._source);

  Future<Either<AppException, List<UserDailyWordModel>>> fetchDailyWords({
    required String userId,
    required int topicId,
    DateTime? assignedDate,
  })async{
    final result = await _source.fetchDailyWords(
      userId: userId,
      topicId: topicId,
      assignedDate: assignedDate,
    );
    return result.map((dailyword){
      return dailyword.map((dto) => dto.toDomain()).toList();
    });
  }
  
}