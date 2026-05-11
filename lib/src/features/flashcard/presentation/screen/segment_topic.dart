import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../configs/themes/text_style.dart';
import '../../../../shared/constants/images_constants.dart';
import '../../../topic/domain/topic_model.dart';

class SegmentTopic extends StatefulWidget {
  const SegmentTopic({
    super.key,
    required this.topicList,
    this.onTopicSelected,
    this.initialPosition = 0,
  });
  final List<TopicModel> topicList;
  final Function(int topicId)? onTopicSelected;
  final int initialPosition;

  @override
  State<SegmentTopic> createState() => _SegmentTopicState();
}

class _SegmentTopicState extends State<SegmentTopic> {
  late int current;
  @override
  void initState() {
    super.initState();
    current = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme color = Theme.of(context).colorScheme;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: widget.topicList.length,
      itemBuilder: (context, index) {
        final topic = widget.topicList[index];
        Color backgroundColor = (current == index)
            ? color.primary
            : color.primary.withValues(alpha: 0.05);
        Color foregroundColor = (current == index)
            ? color.onPrimary
            : color.primary.withValues(alpha: 0.8);
        return Padding(
          padding: EdgeInsets.only(
            right: index == widget.topicList.length - 1 ? 0 : 8.w,
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                current = index;
              });
              widget.onTopicSelected?.call(topic.id);
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
              backgroundColor: backgroundColor,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(color: color.primary.withValues(alpha: 0.5)),
              ),
            ),
            label: Text(
              topic.name,
              style: MyTextStyle.poppinsMedium.copyWith(color: foregroundColor),
            ),
            icon: topic.icon.isEmpty
                ? SvgPicture.asset(
                    MyIcons.learn,
                    colorFilter: ColorFilter.mode(
                      foregroundColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                    height: 24.h,
                    width: 24.h,
                  )
                : SvgPicture.string(
                    topic.icon,
                    colorFilter: ColorFilter.mode(
                      foregroundColor,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.contain,
                    height: 24.h,
                    width: 24.h,
                  ),
          ),
        );
      },
    );
  }
}
