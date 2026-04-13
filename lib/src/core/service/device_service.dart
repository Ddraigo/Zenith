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
    try {
      final token = await _fcmService.getToken(vapidKey: vapidKey);
      return token;
    } catch (e) {
      developer.log(
        'UserDeviceService: error getCurrentFcmToken',
        error: e,
        stackTrace: StackTrace.current,
      );
      return null;
    }
  }

  Future<List<UserDeviceModel>> getUserFcmToken() async {
    try {
      final currentUser = _client.auth.currentUser;
      if (currentUser == null) {
        throw StateError('User not authenticated');
      }
      final fcm = await _repo.getUserFcmToken(userId: currentUser.id);

      return fcm.fold(
        ifLeft: (error) {
          developer.log(
            'ProfileService: Error getUserFcmToken',
            error: error,
            stackTrace: StackTrace.current,
          );
          throw error;
        },
        ifRight: (fcm) => fcm,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> _saveFcmTokenIfNeeded({
    required String fcmToken,
    required String userId,
  }) async {
    final currentTokens = await getUserFcmToken();
    final existsToken = currentTokens.any((e) => e.fcmToken == fcmToken);
    if (existsToken) {
      return false;
    }

    final result = await _repo.saveFcmToken(userId: userId, fcmToken: fcmToken);

    return result.fold(
      ifLeft: (error) {
        developer.log(
          'UserDeviceService: Error saveFcmToken',
          error: error,
          stackTrace: StackTrace.current,
        );
        throw error;
      },
      ifRight: (fcm) => true,
    );
  }

  Future<bool> deleteFcmToken({
    required String fcmToken,
    required String userId,
  }) async {
    final result = await _repo.deleteFcmToken(userId: userId, fcmToken: fcmToken);

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
    try {
      final currentUser = _client.auth.currentUser;
      if (currentUser == null) {
        throw StateError('User not authenticated');
      }

      final fcmToken = await getCurrentFcmToken(vapidKey: vapidKey);

      if (fcmToken != null) {
        await _saveFcmTokenIfNeeded(fcmToken: fcmToken, userId: currentUser.id);
      }
      return fcmToken;
    } catch (e) {
      developer.log(
        'UserDeviceService: Error syncFcmToken',
        error: e,
        stackTrace: StackTrace.current,
      );
      rethrow;
    }
  }

  /// Setup FCM token cho user (dùng cho cả login và signup)
  /// [subscribeToRefresh]: nếu true, sẽ lắng nghe token refresh
  Future<void> setupFcmToken({
    required String userId,
    String? vapidKey,
    bool subscribeToRefresh = true,
  }) async {
    try {
      final newToken = await getCurrentFcmToken(vapidKey: vapidKey);

      if (newToken == null || newToken.isEmpty) return;

      final device = await getUserFcmToken();
      final existsToken = device.any((e) => e.fcmToken == newToken);

      if (!existsToken) {
        await _saveFcmTokenIfNeeded(fcmToken: newToken, userId: userId);
        developer.log(
          'UserDeviceService: FCM token saved',
          name: 'setupFcmToken',
        );
      }

      if (subscribeToRefresh) {
        _tokenRefreshSubscription?.cancel();
        var currentToken = newToken;
        _tokenRefreshSubscription = _fcmService.onTokenRefresh.listen((newToken) async {
          try {
            if (newToken.isEmpty || newToken == currentToken) {
              return;
            }

            final oldToken = currentToken;
            await _saveFcmTokenIfNeeded(fcmToken: newToken, userId: userId);

            if (oldToken.isNotEmpty) {
              await deleteFcmToken(fcmToken: oldToken, userId: userId);
            }

            currentToken = newToken;
            developer.log(
              'UserDeviceService: FCM token refreshed',
              name: 'setupFcmToken',
            );
          } catch (e) {
            developer.log(
              'UserDeviceService: Error onTokenRefresh',
              error: e,
              stackTrace: StackTrace.current,
            );
          }
        });
      }
    } catch (e) {
      developer.log(
        'UserDeviceService: Error setupFcmToken',
        error: e,
        stackTrace: StackTrace.current,
      );
      return;
    }
  }

  Future<void> cleanupDeviceTokenOnSignOut({required String userId}) async {
    try {
      final currentToken = await getCurrentFcmToken();

      if (currentToken != null && currentToken.isNotEmpty) {
        await deleteFcmToken(fcmToken: currentToken, userId: userId);
      }

      await _fcmService.deleteToken();
    } catch (e) {
      developer.log(
        'UserDeviceService: Error cleanupDeviceTokenOnSignOut',
        error: e,
        stackTrace: StackTrace.current,
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
}
