
import 'dart:developer' as developer;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

      developer.log('FirebaseMessaging: Permission requested', name: 'FCMService');
      print('Notification permission: ${settings.authorizationStatus}');

      _setupMessageHandlers();
    } catch (e) {
      developer.log('FirebaseMessaging: Error initialize',
      error: e,
      stackTrace: StackTrace.current,
      name: 'FirebaseMessagingService');
      rethrow;
    }
  }

    Future<String?> getToken({
      String? vapidKey
    })async{
      try {
        final token = await _messaging.getToken(vapidKey: vapidKey);
        developer.log('FCM token: $token', name: 'FirebaseMessagingService');
        return token;
      } catch (e) {
        developer.log('FirebaseMessaging: Error getToken',
          error: e,
          stackTrace: StackTrace.current,
          name: 'FirebaseMessagingService');
        return null;
      }
  }
  

  Stream<String> get onTokenRefresh => _messaging.onTokenRefresh;

  void _setupMessageHandlers(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      developer.log('Setup Message Handlers: ${message.messageId}', name: 'FirebaseMessagingService');
      print('Message data: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      developer.log('Message Opened app: ${message.messageId}', name: 'FirebaseMessagingService');
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
  developer.log('Background Message Handle: ${message.messageId}', name: 'FirebaseMessagingService');
  print('Background Message data: ${message.data}' );
}
