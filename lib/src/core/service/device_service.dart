import 'dart:developer' as developer;
import 'dart:async';

import 'package:app_demo/src/core/data/repository/user_device_repo.dart';
import 'package:app_demo/src/core/domain/user_device_model.dart';
import 'package:app_demo/src/core/service/firebase_messaging_service.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import '../../shared/http/sentry_reporter.dart';

final userDeviceService = Provider(UserDeviceService.new);

class UserDeviceService {
  final Ref _ref;
  UserDeviceService(this._ref);
  late final SupabaseClient _client = _ref.read(supabaseClientProvider);
  late final UserDeviceRepo _repo = _ref.read(userDeviceRepoProvider);
  late final FirebaseMessagingService _fcmService = _ref.read(
    firebaseMessagingService,
  );

  StreamSubscription<String>? _tokenRefreshSubscription;

  Future<String?> getCurrentFcmToken({String? vapidKey}) async {
    if (_isBlank(vapidKey)) {
      if (kDebugMode) {
        developer.log(
          'UserDeviceService: skip get token because vapidKey is empty',
          name: 'getCurrentFcmToken',
        );
      }
      return null;
    }
    try {
      return await _fcmService.getToken(vapidKey: vapidKey);
    } catch (e, st) {
      if (kDebugMode) {
        developer.log(
          'UserDeviceService: getCurrentFcmToken failed',
          error: e,
          stackTrace: st,
          name: 'getCurrentFcmToken',
        );
      }

      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: st,
            tags: {
              'feature': 'device',
              'action': 'get_current_fcm_token',
              'layer': 'service'
            },
          ));

      return null;
    }
  }

  Future<List<UserDeviceModel>> getUserFcmToken() async {
    final currentUser = _requireCurrentUserId();
    final result = await _repo.getUserFcmToken(userId: currentUser);

    return result.fold(
      ifLeft: (error) {
          if (kDebugMode) {
            developer.log(
              'UserDeviceService: getUserFcmToken failed',
              error: error,
              stackTrace: StackTrace.current,
              name: 'getUserFcmToken',
            );
          }

          Future.microtask(() => SentryReporter.captureException(
                error,
                stackTrace: StackTrace.current,
                tags: {'feature': 'device', 'action': 'get_user_fcm_token', 'layer': 'service'},
                context: {'user_context': {'user_id': currentUser}},
              ));

          throw error;
      },
      ifRight: (tokens) => tokens,
    );
  }

  Future<bool> _saveFcmTokenIfNeeded({
    required String fcmToken,
    required String userId,
    List<UserDeviceModel>? currentTokens,
  }) async {
    final tokens = currentTokens ?? await getUserFcmToken();
    final existsToken = tokens.any((e) => e.fcmToken == fcmToken);
    if (existsToken) {
      return false;
    }

    final result = await _repo.saveFcmToken(userId: userId, fcmToken: fcmToken);

    return result.fold(
      ifLeft: (error) {
        if (kDebugMode) {
          developer.log(
            'UserDeviceService: saveFcmToken failed',
            error: error,
            stackTrace: StackTrace.current,
            name: '_saveFcmTokenIfNeeded',
          );
        }

        Future.microtask(() => SentryReporter.captureException(
              error,
              stackTrace: StackTrace.current,
              tags: {'feature': 'device', 'action': 'save_fcm_token', 'layer': 'service'},
              context: {'operation_context': {'resource_id': userId}},
            ));

        throw error;
      },
      ifRight: (_) => true,
    );
  }

  Future<bool> deleteFcmToken({
    required String fcmToken,
    required String userId,
  }) async {
    final result = await _repo.deleteFcmToken(
      userId: userId,
      fcmToken: fcmToken,
    );

    return result.fold(
      ifLeft: (error) {
        if (kDebugMode) {
          developer.log(
            'UserDeviceService: Error deleteFcmToken',
            error: error,
            stackTrace: StackTrace.current,
          );
        }

        Future.microtask(() => SentryReporter.captureException(
              error,
              stackTrace: StackTrace.current,
              tags: {'feature': 'device', 'action': 'delete_fcm_token', 'layer': 'service'},
              context: {'operation_context': {'resource_id': userId}},
            ));

        throw error;
      },
      ifRight: (_) => true,
    );
  }

  Future<String?> syncFcmToken({String? vapidKey}) async {
    final currentUser = _requireCurrentUserId();
    final fcmToken = await getCurrentFcmToken(vapidKey: vapidKey);
    if (_isBlank(fcmToken)) return null;

    await _saveFcmTokenIfNeeded(fcmToken: fcmToken!, userId: currentUser);

    return fcmToken;
  }

  /// Setup FCM token cho user (dùng cho cả login và signup)
  /// [subscribeToRefresh]: nếu true, sẽ lắng nghe token refresh
  Future<void> setupFcmToken({
    required String userId,
    String? vapidKey,
    bool subscribeToRefresh = true,
  }) async {
    final token = await getCurrentFcmToken(vapidKey: vapidKey);

    if (_isBlank(token)) {
      developer.log(
        'UserDeviceService: skip setup because token is empty',
        name: 'setupFcmToken',
      );
      return;
    }
    try {
      final currentToken = await getUserFcmToken();
      final existsToken = currentToken.any((e) => e.fcmToken == token);

      if (!existsToken) {
        // xóa hết token, chi giữ 1 token/user
        for (final oldToken in currentToken) {
          await deleteFcmToken(fcmToken: oldToken.fcmToken, userId: userId);
        }
        
        // Save new token
        await _repo.saveFcmToken(userId: userId, fcmToken: token!);
        if (kDebugMode) {
          developer.log(
            'UserDeviceService: FCM token saved (old tokens cleaned up)',
            name: 'setupFcmToken',
          );
        }

        try {
          Future.microtask(() => SentryReporter.addBreadcrumb(
                'FCM token saved',
                category: 'device',
                data: {'token_prefix': token.substring(0, 10), 'user_id': userId},
              ));
        } catch (_) {}
      }
      if (subscribeToRefresh) {
        _startTokenRefreshListener(userId: userId, initialToken: token!);
      }
    } catch (e, st) {
      if (kDebugMode) {
        developer.log(
          'UserDeviceService: setupFcmToken failed',
          error: e,
          stackTrace: st,
          name: 'setupFcmToken',
        );
      }

      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: st,
            tags: {
              'feature': 'device',
              'action': 'setup_fcm_token',
              'layer': 'service'
            },
            context: {'user_context': {'user_id': userId}},
          ));

      rethrow;
    }
  }

  void _startTokenRefreshListener({
    required String userId,
    required String initialToken,
  }) {
    _tokenRefreshSubscription?.cancel();
    var currentToken = initialToken;
    _tokenRefreshSubscription = _fcmService.onTokenRefresh.listen((
      newToken,
    ) async {
      try {
        if (newToken.isEmpty || newToken == currentToken) {
          return;
        }

        final oldToken = currentToken;
        await _saveFcmTokenIfNeeded(
          fcmToken: newToken,
          userId: userId,
        );

        if (oldToken.isNotEmpty) {
          await deleteFcmToken(fcmToken: oldToken, userId: userId);
        }

        currentToken = newToken;
      } catch (e, st) {
        if (kDebugMode) {
          developer.log(
            'UserDeviceService: token refresh stream error',
            error: e,
            stackTrace: st,
            name: '_startTokenRefreshListener',
          );
        }

        Future.microtask(() => SentryReporter.captureException(
              e,
              stackTrace: st,
              tags: {
                'feature': 'device',
                'action': 'token_refresh_listener',
                'layer': 'service',
                'flow': 'listener_callback'
              },
              context: {'device_context': {'token_status': 'refresh_error'}},
            ));
      }
    });
  }

  Future<void> cleanupDeviceTokenOnSignOut({required String userId}) async {
    try {
      final currentToken = await getCurrentFcmToken();

      if (currentToken != null && currentToken.isNotEmpty) {
        await deleteFcmToken(fcmToken: currentToken, userId: userId);
      }

      await _fcmService.deleteToken();
    } catch (e, st) {
      if (kDebugMode) {
        developer.log(
          'UserDeviceService: Error cleanupDeviceTokenOnSignOut',
          error: e,
          stackTrace: st,
        );
      }

      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: st,
            tags: {'feature': 'device', 'action': 'cleanup_on_signout', 'layer': 'service'},
          ));
    } finally {
      _tokenRefreshSubscription?.cancel();
      _tokenRefreshSubscription = null;
    }
  }

  void dispose() {
    _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }

  String _requireCurrentUserId() {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      throw StateError('User not authenticated');
    }
    return userId;
  }

  bool _isBlank(String? value) => value == null || value.trim().isEmpty;
}
