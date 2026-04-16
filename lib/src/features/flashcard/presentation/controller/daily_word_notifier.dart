
import 'package:app_demo/src/features/flashcard/application/user_daily_word_service.dart';
import 'package:app_demo/src/features/flashcard/domain/user_daily_word_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'daily_word_notifier.g.dart';

@riverpod
class DailyWordNotifier extends _$DailyWordNotifier{

  // FutureOr<void> build() {
  // }

  @override
  Future<List<UserDailyWordModel>> build(DateTime assignedDate) async {
    return _loadDailyWord(assignedDate);
  }

  Future<void> refresh(DateTime assignedDate) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _loadDailyWord(assignedDate),
    );
  }

  Future<List<UserDailyWordModel>> _loadDailyWord(DateTime assignedDate) async{
    final result = await ref.read(userDailyWordServiceProvider).getDailyWords(assignedDate: assignedDate);
    return result.fold(
      ifLeft: (e) => throw e, 
      ifRight: (data) => data,
    );
  }
}