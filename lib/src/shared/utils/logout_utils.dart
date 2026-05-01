import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_demo/src/core/provider/current_user_id_notifire.dart';
import 'package:app_demo/src/core/provider/reward_summary_provider.dart';
import 'package:app_demo/src/core/provider/shared_flashcard_notifier.dart';
import 'package:app_demo/src/core/presentation/controller/quiz_result_notifier.dart';
import 'package:app_demo/src/features/ai_support/presentation/controller/ai_support_notifier.dart';
import 'package:app_demo/src/features/flashcard/presentation/controller/daily_word_notifier.dart';
import 'package:app_demo/src/features/flashcard/presentation/controller/flashcard_notifier.dart';
import 'package:app_demo/src/features/profile/presentation/controller/profile_notifier.dart';
import 'package:app_demo/src/features/quiz/presentation/controller/quiz_notifier.dart';
import 'package:app_demo/src/features/statistics/presentation/controller/statistics_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/controller/list_topic_notifier.dart';
import 'package:app_demo/src/features/topic/presentation/controller/topic_flashcard_notifier.dart';

void invalidateUserSessionProviders(WidgetRef ref) {
  ref.invalidate(currentUserIdProvider);
  ref.invalidate(userEmailProvider);
  ref.invalidate(hasProfileProvider);
  ref.invalidate(profileProvider);
  ref.invalidate(aISupportProvider);
  ref.invalidate(statisticsProvider);
  ref.invalidate(flashcardProvider);
  ref.invalidate(topicFLashcardProvider);
  ref.invalidate(listTopicProvider);
  ref.invalidate(dailyWordProvider);
  ref.invalidate(quizSessionProvider);
  ref.invalidate(quizResultProvider);
  ref.invalidate(streakDayProvider);
  ref.invalidate(getTopicListProvider);
  ref.invalidate(getFlashcardsProvider);
  ref.invalidate(getDailyTopicsGroupedProvider);
  ref.invalidate(getDailyAllTopicsGroupedProvider);
  ref.invalidate(resolvedTopicIdProvider);
  ref.invalidate(getFlashcardCountByTopicProvider);
  ref.invalidate(selectedTopicDaily);
  ref.invalidate(selectedTopicProvider);
  ref.invalidate(flashcardIndexProvider);
  ref.invalidate(isDailyModeProvider);
  ref.invalidate(selectedDateProvider);
  ref.invalidate(rewardSummaryProvider);
  ref.invalidate(homeTapProvider);
}
