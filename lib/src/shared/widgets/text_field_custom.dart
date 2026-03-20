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
    final Color inActiveColor = colorScheme.outline;
    final Color errorColor = colorScheme.error;

    return ListenableBuilder(
        listenable: focusNode,
        builder: (context, _) {
          final bool isFocused = focusNode.hasFocus;
          final bool hasError = errorText != null && errorText!.isNotEmpty;
          Color iconColor;
          if (hasError) {
            iconColor = errorColor;
          } else if (isFocused) {
            iconColor = activeColor;
          } else {
            iconColor = inActiveColor;
          }
          return TextField(
            focusNode: focusNode,
            style: MyTextStyle.formTextNormal,
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: isFocused
                  ? MyTextStyle.formTextFill
                  : MyTextStyle.formTextNormal,
              contentPadding: EdgeInsets.symmetric(vertical: 16),
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
                minWidth: 48,
              ),
              prefixIconColor: isFocused ? activeColor : inActiveColor,
              errorText: errorText,
              errorStyle: MyTextStyle.formTextFill.copyWith(color: errorColor),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: inActiveColor,
                    width: 1,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: activeColor,
                    width: 2,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: errorColor,
                    width: 2,
                  )),
            ),
          );
        });
  }
}
