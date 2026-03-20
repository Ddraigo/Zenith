
import 'dart:developer';

import 'package:app_demo/src/app/app.dart';
import 'package:app_demo/src/shared/utils/logger.dart';
import 'package:app_demo/src/shared/utils/platform_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> start() async{
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details){
  log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();

  runApp(
    ProviderScope(
      overrides: [
        platformTypeProvider.overrideWithValue(platformType),
      ],
      observers: [
        Logger()
      ],
      child: const MyApp()
    ),
  );

}