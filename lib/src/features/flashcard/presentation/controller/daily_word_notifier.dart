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
    return ref.read(userDailyWordServiceProvider).getDailyWords(assignedDate: assignedDate);
  }

  Future<void> refresh(DateTime assignedDate) async{
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(userDailyWordServiceProvider).getDailyWords(assignedDate: assignedDate)
    );
  }
}