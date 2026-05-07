
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/provider/current_user_id_notifire.dart';

class MyAvatar extends ConsumerWidget {
  const MyAvatar({
    super.key,
    required this.userAvatar,
    this.onTap,
    required this.size,
  });
  final String userAvatar;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final bool hasAvatarUrl = userAvatar.isNotEmpty;
    final userEmail = ref.watch(userEmailProvider);
    final String initial = _getInitial(userEmail);
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.purple.shade600,
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
