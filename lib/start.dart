import 'dart:async';

import 'package:app_demo/src/app/app.dart';
import 'package:app_demo/src/core/service/firebase_messaging_service.dart';
import 'package:app_demo/src/shared/http/sentry_reporter.dart';
import 'package:app_demo/src/shared/utils/logger.dart';
import 'package:app_demo/src/shared/utils/platform_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

String _fileName = 'lib/configs/env/.env.development';

Future<void> start() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await dotenv.load(fileName: _fileName);
      final packageInfo = await PackageInfo.fromPlatform();
      final release = '${packageInfo.version}+${packageInfo.buildNumber}';

      final supabaseUrl = dotenv.env['SUPABASE_URL']?.trim() ?? '';
      final supabaseKey = dotenv.env['SUPABASE_ANON_KEY']?.trim() ?? '';

      await SentryFlutter.init(
        (options) {
          // Adds request headers and IP for users, for more info visit:
          // https://docs.sentry.io/platforms/dart/guides/flutter/data-management/data-collected/
          options.dsn = dotenv.env['SENTRY_DSN']?.trim() ?? '';
          options.release = release;
          options.environment = 'development';
          options.tracesSampleRate = 0.1;
          options.profilesSampleRate = 0.1;
          options.sendDefaultPii = true;
          options.replay.sessionSampleRate = 0.1;
          options.replay.onErrorSampleRate = 0.1;
        },
        appRunner: () async {
          final platformType = detectPlatformType();

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
            SentryWidget(
              child: ProviderScope(
                overrides: [
                  platformTypeProvider.overrideWithValue(platformType),
                ],
                observers: [Logger()],
                child: const MyApp(),
              ),
            ),
          );
        },
      );
    },
    (error, stackTrace) async {
      await SentryReporter.captureException(error, stackTrace: stackTrace);
    },
  );

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    Sentry.captureException(
      details.exceptionAsString(),
      stackTrace: details.stack,
    );
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    Sentry.captureException(error, stackTrace: stack);
    return true; // handled
  };
}
