import 'package:app_demo/src/features/authentication/presentation/controller/onboarding_controller.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_dot_navigation.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_page.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/onboarding/onboarding_skip.dart';
import 'package:app_demo/src/features/authentication/presentation/widget/login/login_screen.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OnboardingScreenState();
  
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>{
  late final PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(onboardingPageProvider);
    final isLastPage = currentPage == 2;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) => ref.read(onboardingPageProvider.notifier).state = index,
              children: const [
                OnBoardingPage(
                  title: 'Purchase Online !!',
                  image: MyImages.onBoardingImage4,
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
                  invertColors: false,
                  shape: MyImages.onBoardingImage1,
                  onLeft: true,
                  index: 1,
                ),
                OnBoardingPage(
                  title: 'Track order !!',
                  image: MyImages.onBoardingImage5,
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
                  invertColors: true,
                  shape: MyImages.onBoardingImage2,
                  onLeft: true,
                  index: 2,
                ),
                OnBoardingPage(
                  title: 'Get your order !!',
                  image: MyImages.onBoardingImage6,
                  subTitle:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
                  invertColors: false,
                  shape: MyImages.onBoardingImage3,
                  onLeft: false,
                  index: 3,
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              right: 20,
              left: 30,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnBoardingDotNavigation(controller: _pageController, count: 3,),
                  OnBoardingSkip(
                    isLastPage: isLastPage,
                    onPressed: (){
                      if(isLastPage){
                        Navigator.push(context, 
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          )
                        );
                      }else{
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300), 
                          curve: Curves.easeIn
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  







