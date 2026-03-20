import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ButtonType { elevated, outlined, text, filled }

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {super.key,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      this.icon,
      this.label,
      required this.type,
      this.padding,
      this.minimumSize = const Size(double.infinity, 56),
      required this.onPressed,
      this.borderRadius = 5,
      this.textAlign = TextAlign.center, 
      this.iconSize = 24
      }) : assert(
        (label != null && label != '') || (icon != null && icon != ''),
        'Button ít nhất phải có lable hoặc icon',
      );

  final Color? backgroundColor, foregroundColor, borderColor;
  final String? icon, label;
  final ButtonType type;
  final EdgeInsetsGeometry? padding;
  final Size minimumSize;
  final VoidCallback onPressed;
  final double borderRadius;
  final TextAlign textAlign;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final child = _buildContent(colorScheme);

    return switch (type) {
      ButtonType.elevated => ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              maximumSize: minimumSize,
              alignment: Alignment.center,
              minimumSize: minimumSize,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              padding: padding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              )),
          child: child,
        ),
      ButtonType.outlined => OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: padding,
            maximumSize: minimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(color: borderColor ?? colorScheme.onInverseSurface),
          ),
          child: child,
        ),
      ButtonType.text => TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: padding,
            maximumSize: minimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: child,
        ),
      ButtonType.filled => FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            padding: padding,
            maximumSize: minimumSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: child,
        ),
    };
  }

  Widget _buildContent(ColorScheme colorScheme) {
    final hasIcon = icon != null && icon!.isNotEmpty;
    final hasLable = label != null && label!.isNotEmpty;

    if (hasIcon && hasLable) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
        children: [
          SvgPicture.asset(
            width: iconSize,
            height: iconSize,
            icon!,
          ),
          Expanded(
            child: Text(
              label!,
              textAlign: textAlign,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
        ],
            ),
      );
    }
    if (hasIcon) {
      return SvgPicture.asset(
        icon!,
        width: iconSize,
        height: iconSize,
        fit: BoxFit.contain,
      );
    }

    return Text(
      label!,
      textAlign: textAlign,
    );
  }
}
