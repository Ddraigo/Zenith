
import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({
    super.key,
    required this.userAvatar,
    this.displayName,
    this.onTap,
    required this.size,
  });
  final String userAvatar;
  final String? displayName;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final bool hasAvatarUrl = userAvatar.isNotEmpty;
    final String initial = _getInitial(displayName);
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.purple.shade800,
        backgroundImage: hasAvatarUrl
            ? NetworkImage(userAvatar) as ImageProvider
            : null,
        child: hasAvatarUrl
            ? null
            : Text(
                initial,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size * 0.9,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }

  String _getInitial(String? text) {
    final value = (text ?? '').trim();
    if (value.isEmpty) return '?';
    final base = value.contains('@') ? value.split('@').first : value;
    if (base.isEmpty) return '?';
    return base.substring(0, 1).toUpperCase();
  }
}
