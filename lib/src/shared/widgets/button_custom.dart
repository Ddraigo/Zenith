import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      this.minimumSize,
      required this.onPressed,
      this.borderRadius,
      this.textAlign = TextAlign.center, 
      this.iconSize = 24
      }) : assert(
        (label != null && label != '') || (icon != null && icon != ''),
        'Button ít nhất phải có label hoặc icon',
      );

  final Color? backgroundColor, foregroundColor, borderColor;
  final String? icon, label;
  final ButtonType type;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final TextAlign textAlign;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final child = _buildContent();

    final ButtonStyle? customStyle = _style(context, colorScheme);

    return switch (type) {
      ButtonType.elevated => ElevatedButton(
          onPressed: onPressed,
          style: customStyle,
          child: child,
        ),
      ButtonType.outlined => OutlinedButton(
          onPressed: onPressed,
          style: customStyle,
          child: child,
        ),
      ButtonType.text => TextButton(
          onPressed: onPressed,
          style: customStyle,
          child: child,
        ),
      ButtonType.filled => FilledButton(
          onPressed: onPressed,
          style: customStyle,
          child: child,
        ),
    };
  }

  ButtonStyle? _style(BuildContext context, ColorScheme colorScheme){
    if(backgroundColor == null &&
    foregroundColor == null &&
    borderColor == null &&
    minimumSize == null &&
    borderRadius == null){
      return null;
    }

    final shape = borderRadius == null ? null
    : RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius!),
    );

    return ButtonStyle(
      backgroundColor: backgroundColor != null ?
      WidgetStatePropertyAll(backgroundColor)
      : null,
      foregroundColor: foregroundColor != null ? 
      WidgetStatePropertyAll(foregroundColor) 
      : null,
      padding: padding != null ? WidgetStatePropertyAll(padding) : null,
      minimumSize: minimumSize != null ? WidgetStatePropertyAll(minimumSize) : null,
      shape: shape != null ? WidgetStatePropertyAll(shape) : null,
      side: type == ButtonType.outlined ? WidgetStatePropertyAll(
        BorderSide(color: borderColor ?? colorScheme.outline),
      ) : null,
    );
  }

  Widget _buildContent() {
    final hasIcon = icon != null && icon!.isNotEmpty;
    final hasLable = label != null && label!.isNotEmpty;

    if (hasIcon && hasLable) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            width: iconSize?.w,
            height: iconSize?.w,
            icon!,
          ),
          Expanded(
            child: Text(
              label!,
              textAlign: textAlign,
            ),
          ),
          SizedBox(
            width: 24.w,
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
