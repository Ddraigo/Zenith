import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key, required this.onPressed
  });

  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'Skip'
      ),
    );
  }
}

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key, 
    required this.isLastPage, 
    required this.onPressed});

  final bool isLastPage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final coloScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: coloScheme.primaryContainer,
        foregroundColor: coloScheme.primary,
        textStyle: MyTextStyle.poppinsMedium700,
      ),
      child: Text(
        'Next'
      ),       
    );
  }
}
