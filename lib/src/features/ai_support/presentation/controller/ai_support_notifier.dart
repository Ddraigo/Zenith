import 'dart:async';
import 'dart:developer' as developer;

import 'package:app_demo/src/features/ai_support/application/ai_support_service.dart';
import 'package:app_demo/src/features/ai_support/domain/ai_support_result_model.dart';
import 'package:app_demo/src/shared/http/app_exception.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ai_support_notifier.g.dart';

final aiQuotaBlockedProvider = StateProvider<bool>((ref) => false);
final aiSupportPendingCountProvider = StateProvider<int>((ref) => 0);

const _pendingPollInterval = Duration(seconds: 3);
const _maxPendingPolls = 45;
const _quotaBlockDuration = Duration(minutes: 1);

@riverpod
class AISupportNotifier extends _$AISupportNotifier {
  Timer? _quotaResetTimer;
  Timer? _pendingPollTimer;

  void _blockQuotaTemporarily() {
    ref.read(aiQuotaBlockedProvider.notifier).state = true;
    _quotaResetTimer?.cancel();
    _quotaResetTimer = Timer(_quotaBlockDuration, () {
      ref.read(aiQuotaBlockedProvider.notifier).state = false;
      developer.log('AISupportNotifier: _blockQuotaTemporarily unblocking');
    });
  }

  void _resetPendingCount() {
    ref.read(aiSupportPendingCountProvider.notifier).state = 0;
  }

  void _incrementPendingCount() {
    int count = ref.read(aiSupportPendingCountProvider.notifier).state;
    ref.read(aiSupportPendingCountProvider.notifier).state = count + 1;
  }

  @override
  Future<AISupportResultModel> build(String flashcardId) async {
    ref.onDispose(() {
      _quotaResetTimer?.cancel();
      _pendingPollTimer?.cancel();
    });
    _resetPendingCount();
    return _loadData(flashcardId);
  }

  void _schedulePendingPoll(String flashcardId) {
    if (_pendingPollTimer?.isActive ?? false) return;
    _pendingPollTimer = Timer(_pendingPollInterval, () {
      if (!ref.mounted) return;
      refresh(flashcardId);
    });
  }

  Future<AISupportResultModel> _loadData(String flashcardId) async {
    try {
      final result = await ref
          .read(aiSupportServiceProvider)
          .getAISupport(flashcardId: flashcardId);
      return result.fold(
        ifLeft: (e) {
          e.maybeWhen(
            server: (msg) {
              if (msg.toLowerCase().contains('quota')) {
                _blockQuotaTemporarily();
              }
            },
            orElse: () {},
          );
          throw e;
        },
        ifRight: (data) {
          if (data.source == TypeSource.quotaExceeded) {
            _blockQuotaTemporarily();
            return data;
          }
          if (data.source == TypeSource.pending) {
            _incrementPendingCount();
            final pendingCount = ref.read(aiSupportPendingCountProvider);

            if (pendingCount > _maxPendingPolls) {
              developer.log('AISupportNotifier: pending timeout');
              throw AppException.errorWithMessage(
                'Yêu cầu đã hết hạn. Vui lòng thử lại sau',
              );
            }
            _schedulePendingPoll(flashcardId);
          } else {
            _resetPendingCount();
            _pendingPollTimer?.cancel();
          }
          return data;
        },
      );
    } catch (e, st) {
      developer.log(
        'AISupportNotifier: _loadData error',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  Future<void> refresh(String flashcardId) async {
    state = await AsyncValue.guard(() => _loadData(flashcardId));
  }
}
