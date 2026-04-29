import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
    this.backgroundColor,
    this.spinnerColor,
  });
  final bool isLoading;
  final Widget child;
  final Color? backgroundColor;
  final Color? spinnerColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: (backgroundColor ?? Colors.black).withValues(alpha: 0.3),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  spinnerColor ?? Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
