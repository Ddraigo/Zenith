import 'package:app_demo/src/features/authentication/presentation/controller/onboarding_controller.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_dot_navigation.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_page.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_skip.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/login/login_screen.dart';
import 'package:app_demo/src/routes/app_router.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(onboardingPageProvider);
    final isLastPage = currentPage == 2;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) =>
                  ref.read(onboardingPageProvider.notifier).state = index,
              children: const [
                OnBoardingPage(
                  title: 'Welcome to the most tastiest app',
                  image: MyImages.onBoardingImage1,
                  subTitle:
                      'You know, this app is edible meaning you can eat it!',

                  index: 1,
                ),
                OnBoardingPage(
                  title: 'We use nitro on bicycles for delivery!',
                  image: MyImages.onBoardingImage2,
                  subTitle:
                      'For very fast delivery we use nitro on bicycles, kidding, but we’re very fast.',
                  index: 2,
                ),
                OnBoardingPage(
                  title: 'We’re the besties of birthday peoples',
                  image: MyImages.onBoardingImage3,
                  subTitle:
                      'We send cakes to our plus members, (only one cake per person)',
                  index: 3,
                ),
              ],
            ),
            OnBoardingDotNavigation(controller: _pageController, count: 3),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: OnboardingNext(
                    isLastPage: isLastPage,
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: OnBoardingSkip(
                    onPressed: () => context.go(AppRouter.loginPath),
                    
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
