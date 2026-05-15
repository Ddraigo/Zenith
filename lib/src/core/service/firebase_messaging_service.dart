
import 'dart:developer' as developer;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/http/sentry_reporter.dart';

final firebaseMessagingService = Provider((ref)=> FirebaseMessagingService());
class FirebaseMessagingService {
  late final FirebaseMessaging _messaging = FirebaseMessaging.instance;


  Future<void> initialize({
    required String? vapidKey,
  })async{
    try {
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: true,
      );

      if (kDebugMode) developer.log('FirebaseMessaging: Permission requested', name: 'FCMService');

      Future.microtask(() => SentryReporter.addBreadcrumb(
            'FCM permission requested',
            category: 'fcm',
            data: {'authorizationStatus': settings.authorizationStatus.toString()},
          ));

      _setupMessageHandlers();
    } catch (e) {
      if (kDebugMode) {
        developer.log('FirebaseMessaging: Error initialize',
          error: e, stackTrace: StackTrace.current, name: 'FirebaseMessagingService');
      }

      Future.microtask(() => SentryReporter.captureException(
            e,
            stackTrace: StackTrace.current,
            tags: {
              'feature': 'fcm',
              'action': 'request_permission',
              'layer': 'service',
              'flow': 'initialize'
            },
            context: {
              'device_context': {'permission_status': 'failed', 'error_type': e.runtimeType.toString()}
            },
          ));
      rethrow;
    }
  }


    Future<String?> getToken({
      String? vapidKey
    })async{
      try {
          final token = await _messaging.getToken(vapidKey: vapidKey);
          if (kDebugMode) developer.log('FCM token: ${token?.substring(0, 10)}', name: 'FirebaseMessagingService');

          Future.microtask(() => SentryReporter.addBreadcrumb(
                'FCM token obtained',
                category: 'fcm',
                data: {'token_prefix': token == null ? 'null' : token.substring(0, 10)},
              ));

          return token;
      } catch (e) {
          if (kDebugMode) {
            developer.log('FirebaseMessaging: Error getToken',
              error: e, stackTrace: StackTrace.current, name: 'FirebaseMessagingService');
          }

          Future.microtask(() => SentryReporter.captureException(
                e,
                stackTrace: StackTrace.current,
                tags: {
                  'feature': 'fcm',
                  'action': 'get_token',
                  'layer': 'service',
                  'flow': 'initialize'
                },
                context: {
                  'device_context': {'token_status': 'failed', 'error_type': e.runtimeType.toString()}
                },
              ));

          return null;
      }
  }
  

  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  void _setupMessageHandlers(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (kDebugMode) developer.log('Setup Message Handlers: ${message.messageId}', name: 'FirebaseMessagingService');
      if (kDebugMode) print('Message data: ${message.data}');
      try {
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'FCM message received',
              category: 'fcm_handler',
              data: {'topic': message.data['topic'], 'flow': 'user_foreground'},
            ));
      } catch (_) {}
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      if (kDebugMode) developer.log('Message Opened app: ${message.messageId}', name: 'FirebaseMessagingService');
      try {
        Future.microtask(() => SentryReporter.addBreadcrumb(
              'FCM message opened app',
              category: 'fcm_handler',
              data: {'message_id': message.messageId, 'flow': 'user_interaction'},
            ));
      } catch (_) {}
      _handleMessageInteraction(message);
    });

    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandle);
  }

  void _handleMessageInteraction(RemoteMessage message){
    final data = message.data;
    developer.log('Handle message: type=${data['type']}',
     name: 'FirebaseMessagingService');
    
  }

    Future<RemoteMessage?> getInitialMessage() async{
    return await _messaging.getInitialMessage();
  }

  Future<void> deleteToken()async{
    await _messaging.deleteToken();
  }

}

Future<void> _backgroundMessageHandle(RemoteMessage message) async{
  if (kDebugMode) developer.log('Background Message Handle: ${message.messageId}', name: 'FirebaseMessagingService');
  try {
    Future.microtask(() => SentryReporter.addBreadcrumb(
          'FCM background message received',
          category: 'fcm_handler',
          data: {'topic': message.data['topic'], 'message_id': message.messageId},
        ));
  } catch (_) {}
}
