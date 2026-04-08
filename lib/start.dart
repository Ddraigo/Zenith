import 'dart:developer';

import 'package:app_demo/src/app/app.dart';
import 'package:app_demo/src/core/service/firebase_messaging_service.dart';
import 'package:app_demo/src/shared/utils/logger.dart';
import 'package:app_demo/src/shared/utils/platform_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

String _fileName = 'lib/configs/env/.env.development';


Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  await dotenv.load(fileName:_fileName);

  final supabaseUrl = dotenv.env['SUPABASE_URL']?.trim() ?? '';
  final supabaseKey = dotenv.env['SUPABASE_ANON_KEY']?.trim() ?? '';

  if (supabaseUrl.isEmpty || supabaseKey.isEmpty) {
    throw StateError('SUPABASE_URL or SUPABASE_KEY is null');
  }
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  final vapidKey = dotenv.env['FCM_VAPID_KEY'];
  final fcmService = FirebaseMessagingService();
  await fcmService.initialize(vapidKey: vapidKey);

  runApp(
    ProviderScope(
      overrides: [platformTypeProvider.overrideWithValue(platformType)],
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}
