import 'package:app_demo/configs/routes/app_router.dart';
import 'package:app_demo/configs/themes/theme_data/theme_data_dark.dart';
import 'package:app_demo/configs/themes/theme_data/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            darkTheme: getDarkTheme(),
            theme: getLightTheme(),
            themeMode: ThemeMode.light,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}