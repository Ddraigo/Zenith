import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.icon,
    required this.hintText,
    this.color,
    this.obscureText = false,
    this.onChanged,
    required this.controller,
    required this.focusNode,
    this.errorText,
  });

  final String icon;
  final String hintText;
  final Color? color;
  final FocusNode focusNode;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color activeColor = color ?? colorScheme.primary;
    final Color inActiveColor =  colorScheme.onTertiaryContainer;
    final Color errorColor = colorScheme.error;

    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, _) {
        final bool isFocused = focusNode.hasFocus;
        final bool hasError = errorText != null && errorText!.isNotEmpty;

        final Color iconColor = hasError
            ? errorColor
            : isFocused
                ? activeColor
                : inActiveColor;

        final TextStyle hintStyle = hasError
            ? MyTextStyle.poppinsMedium400.copyWith(color: errorColor)
            : isFocused
                ? MyTextStyle.poppinsLarge600.copyWith(color: activeColor)
                : MyTextStyle.poppinsMedium400.copyWith(
                    color: inActiveColor,
                  );

        return TextField(
          controller: controller,
          focusNode: focusNode,
          
          obscureText: obscureText,
          onChanged: onChanged,
          style: MyTextStyle.poppinsMedium400,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            fillColor: hasError ? colorScheme.errorContainer : colorScheme.surfaceContainerLow,
            errorText: errorText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 52,
            ),
          ),
        );
      },
    );
  }
}
