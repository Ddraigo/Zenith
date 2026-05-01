import 'package:flutter/material.dart';

import '../../../configs/themes/text_style.dart';

class BottomSheetListItem extends StatelessWidget {
  const BottomSheetListItem({
    super.key,
    required this.title,
    required this.builder,
    this.heightFactor = 0.9,
  });

  final String title;
  final Widget Function(ScrollController controller) builder;
  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      minChildSize: heightFactor,
      maxChildSize: heightFactor,
      initialChildSize: heightFactor,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(32),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  title,
                  style: MyTextStyle.poppinsLarge600,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: builder(scrollController),
              ),
            ],
          ),
        );
      },
    );
  }
}