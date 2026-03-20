import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key, required this.onPressed, required this.isLastPage,
  });

  final VoidCallback onPressed;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        iconSize: 25,
        padding: EdgeInsets.all(20)),
      child: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
