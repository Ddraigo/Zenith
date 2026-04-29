import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({super.key, this.onChanged, required this.value, this.iconOn, this.iconOff});
  final ValueChanged<bool>? onChanged;
  final bool value;
  final IconData? iconOn;
  final IconData? iconOff;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final WidgetStateProperty<Color?> trackOutlineColor =
        WidgetStateProperty.resolveWith((states) {
          // if (states.contains(WidgetState.disabled)) {
          //   return color.primary.withValues(alpha: 0.7);
          // }
          if (!states.contains(WidgetState.selected)) {
            return color.secondary.withValues(alpha: 0.6);
          }
          return Colors.transparent;
        });

    final WidgetStateProperty<Color?> overlayColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetState, Color>{
          WidgetState.selected: color.primary.withValues(alpha: 0.6),
          WidgetState.disabled: color.onPrimary,
        });

    final WidgetStateProperty<Icon?> thumbIcon =
        WidgetStateProperty<Icon?>.fromMap(<WidgetStatesConstraint, Icon>{
          WidgetState.selected: Icon(iconOn, color: color.primary,),
          WidgetState.any: Icon(iconOff, color: color.onPrimary,),
        });

    return Switch(
      
      value: value,
      overlayColor: overlayColor,
      activeTrackColor: color.primary.withValues(alpha: 0.8),
      inactiveTrackColor: color.secondary.withValues(alpha: 0.1),
      // trackColor: trackColor,
      trackOutlineColor: trackOutlineColor,
      activeThumbColor: color.onPrimary,
      inactiveThumbColor: color.secondary.withValues(alpha: 0.6),
      thumbIcon: thumbIcon,
      onChanged: onChanged,
    );
  }
}
 