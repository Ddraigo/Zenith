import 'package:app_demo/src/features/authentication/presentation/screen/onboarding/onboarding_page.dart';
import 'package:app_demo/src/features/authentication/presentation/screen/onboarding/onboarding_screen.dart';
import 'package:app_demo/src/features/authentication/presentation/screen/login/login_screen.dart';
import 'package:app_demo/src/features/authentication/presentation/screen/signIn/sign_up_screen.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_screen.dart';
import 'package:app_demo/src/features/topic/presentation/screen/topic_srceen.dart';
import 'package:app_demo/src/features/home/presentation/home_screen.dart';
import 'package:app_demo/src/features/profile/presentation/screen/profile_screen.dart';
import 'package:app_demo/src/features/quiz/presentation/screen/quiz_screen.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouter.homePath,
  
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
    ),
    GoRoute(
      path: AppRouter.homePath,
      builder: (context, state)=> HomeScreen(),
    ),
    GoRoute(
      path: AppRouter.profilePath,
      builder: (context, state)=> ProfileScreen(),
    ),
    GoRoute(
      path: AppRouter.topicPath,
      builder: (context, state)=> TopicSrceen(),
    ),
    GoRoute(
      path: AppRouter.testPath,
      builder: (context, state)=> QuizScreen(),
    ),
    GoRoute(
      path: AppRouter.flashcardPath,
      builder: (context, state)=> FlashcardScreen(),
    ),
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(child: Text('Khôgn tìm thấy trang!')),
    );
  },
);

class AppRouter {
  static const String loginPath = '/login';
  static const String onboardingPath = '/onboarding';
  static const String signUpPath = '/signUp';
  static const String homePath = '/home';
  static const String startPage = '/start';
  static const String flashcardPath = '/flashcard';
  static const String profilePath = '/profile';
  static const String topicPath =  '/topic';
  static const String testPath =  '/test';


}