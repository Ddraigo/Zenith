import 'dart:developer' as developer;
import 'dart:async';

import 'package:app_demo/src/core/data/repository/user_device_repo.dart';
import 'package:app_demo/src/core/domain/user_device_model.dart';
import 'package:app_demo/src/core/service/firebase_messaging_service.dart';
import 'package:app_demo/src/shared/http/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      developer.log(
        'UserDeviceService: skip get token because vapidKey is empty',
        name: 'getCurrentFcmToken',
      );
      return null;
    }
    try {
      return await _fcmService.getToken(vapidKey: vapidKey);
    } catch (e, st) {
      developer.log(
        'UserDeviceService: getCurrentFcmToken failed',
        error: e,
        stackTrace: st,
        name: 'getCurrentFcmToken',
      );
      return null;
    }
  }

  Future<List<UserDeviceModel>> getUserFcmToken() async {
    final currentUser = _requireCurrentUserId();
    final result = await _repo.getUserFcmToken(userId: currentUser);

    return result.fold(
      ifLeft: (error) {
        developer.log(
          'UserDeviceService: getUserFcmToken failed',
          error: error,
          stackTrace: StackTrace.current,
          name: 'getUserFcmToken',
        );
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
        developer.log(
          'UserDeviceService: saveFcmToken failed',
          error: error,
          stackTrace: StackTrace.current,
          name: '_saveFcmTokenIfNeeded',
        );
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
        developer.log(
          'UserDeviceService: Error deleteFcmToken',
          error: error,
          stackTrace: StackTrace.current,
        );
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
        await _repo.saveFcmToken(userId: userId, fcmToken: token!);
        developer.log(
        'UserDeviceService: FCM token saved',
        name: 'setupFcmToken',
      );
      }
      if (subscribeToRefresh) {
        _startTokenRefreshListener(userId: userId, initialToken: token!);
      }
    } catch (e, st) {
      developer.log(
        'UserDeviceService: setupFcmToken failed',
        error: e,
        stackTrace: st,
        name: 'setupFcmToken',
      );
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
        developer.log(
          'UserDeviceService: token refresh stream error',
          error: e,
          stackTrace: st,
          name: '_startTokenRefreshListener',
        );
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
      developer.log(
        'UserDeviceService: Error cleanupDeviceTokenOnSignOut',
        error: e,
        stackTrace: st,
      );
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
