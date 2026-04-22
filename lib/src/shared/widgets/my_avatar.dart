
import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final String defaultAvatar = 'assets/images/avarta_default.jpg';
    final bool hasAvatarUrl = userAvatar.isNotEmpty;
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: size,
        backgroundColor: Colors.purple.shade800,
        backgroundImage: hasAvatarUrl
            ? NetworkImage(userAvatar) as ImageProvider
            : AssetImage(defaultAvatar),
        child: hasAvatarUrl
            ? Text(
                'U',
                style: MyTextStyle.poppinsLarge700.copyWith(
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
