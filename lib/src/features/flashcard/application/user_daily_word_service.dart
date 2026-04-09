import 'dart:developer' as developer;

import 'package:app_demo/src/features/flashcard/data/repository/user_daily_word_repository.dart';
import 'package:app_demo/src/features/flashcard/domain/daily_word_summary.dart';
import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';
import 'package:app_demo/src/shared/constants/format.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userDailyWordServiceProvider = Provider(UserDailyWordService.new);

class UserDailyWordService {
  final Ref _ref;
  UserDailyWordService(this._ref);
  late final _client = _ref.read(supabaseClientProvider);
  late final _repo = _ref.read(userDailyWordRepoProvider);

  String get _currentUserId => _client.auth.currentUser!.id;

  Future<List<UserDailyWordModel>> getDailyWords({
    int? topicId,
    DateTime? assignedDate,
  }) async {
    final result = await _repo.fetchDailyWords(
      userId: _currentUserId,
      topicId: topicId ?? 0,
      assignedDate: Format.normalizeDate(assignedDate?.toLocal()),
    );

    return result.fold(
      ifLeft: (error) {
        developer.log(
          'UserDailyWordService: Error fetching data',
          error: error,
          stackTrace: StackTrace.current,
        );
        throw error;
      },
      ifRight: (topics) => topics,
    );
  }

  Future<Map<DateTime, List<DailyWordSummaryModel>>> getDailyTopicsGrouped({
    DateTime? startDate,
    DateTime? endDate,
    int? dayRange
  })async{
    final now = DateTime.now().toUtc();
    final end = endDate ?? now;
    final start = startDate ?? now.subtract((Duration(days: dayRange ?? 7)));

    final result = await _repo.fetchDailyTopicSummary(
      userId: _currentUserId, 
      startDate: start.toUtc(),
      endDate: end.toUtc(),
    );

    return result.fold(
      ifLeft: (error){
        developer.log('UserDailyWordService: error getDailyTopicsGrouped', error: error);
        throw error;
      }, 
      ifRight: (datas){
        final groupedData = <DateTime,List<DailyWordSummaryModel>>{};

        for(final data in datas){
          final date = data.assignedDate;

          groupedData.putIfAbsent(date, () => []);
          groupedData[date]!.add(data);
        }
        return groupedData;
      },
    );
  }

  Future<bool> updateIsCompleted({
    required List<String> flashcardIds,
    required DateTime assignedDate,
  }) async {
    if(flashcardIds.isEmpty){
      return false;
    }
    final result =await  _repo.updateIsCompleted(
        userId: _currentUserId, 
        flashcardIds: flashcardIds, 
        assignedDate: Format.normalizeDate(assignedDate.toUtc())
      );
    return result.fold(
      ifLeft: (error){
        developer.log('UserDailyWordService: error updateIsCompleted', error: error);
        throw error;
      },  
      ifRight: (e) => true);
  }
}
