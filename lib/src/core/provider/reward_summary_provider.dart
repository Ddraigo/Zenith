import 'package:flutter_riverpod/legacy.dart';

class RewardSummary {
  const RewardSummary({
    required this.pointAdded,
    required this.streakAdded,
    required this.streakCount,
    required this.streakReset,
  });

  final int pointAdded;
  final int streakAdded;
  final int streakCount;
  final bool streakReset;

  bool get hasReward => pointAdded > 0 || streakAdded > 0 || streakReset;
}

final rewardSummaryProvider = StateProvider<RewardSummary?>(
  (ref) => null,
);
