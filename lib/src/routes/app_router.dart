import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_page.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_screen.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/login/login_screen.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/signIn/sign_up_screen.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouter.loginPath,
  
  routes: <RouteBase>[
    GoRoute(
      path: AppRouter.onboardingPath,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouter.loginPath,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRouter.signUpPath,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: AppRouter.startPage,
      builder:  (context, state) => const OnBoardingSkipedPage(title: 'Join to get the delicious quizines!', image: MyImages.onBoardingImage4),
    )
    // GoRoute(
    //   path: AppRouter.homePath,
    //   builder: (context, state){
    //     final profileData = state.extra as String?;
    //     return HomeScreen(profileData: profileData,);
    //   }
    // ),
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(child: Text('The page not found!')),
    );
  },
);

class AppRouter {
  static const String loginPath = '/login';
  static const String onboardingPath = '/onboarding';
  static const String signUpPath = '/signUp';
  static const String homePath = '/home';
  static const String startPage = '/start';

}