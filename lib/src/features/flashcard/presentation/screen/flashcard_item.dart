import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/features/ai_support/presentation/screen/ai_support_bottom_sheet.dart';
import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FlashcardItem extends StatefulWidget {
  const FlashcardItem({super.key, required this.flashcard, this.onCallAI});
  final VoidCallback? onCallAI;
  final FlashcardModel flashcard;

  @override
  State<FlashcardItem> createState() => _FlashcardItemState();
}

class _FlashcardItemState extends State<FlashcardItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _isFront;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _isFront = true;
  }

  @override
  void didUpdateWidget(covariant FlashcardItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.flashcard.id != widget.flashcard.id) {
      _controller
        ..stop()
        ..value = 0;
      _isFront = true;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    HapticFeedback.lightImpact();
    if (_isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value * 3.14159),

            alignment: Alignment.center,
            child: SizedBox(
              height: 420.h,
              width: double.infinity,
              child: _animation.value < 0.5
                  ? _flashcardFront(colorScheme)
                  : Transform.scale(
                      scaleX: -1,
                      scaleY: 1,
                      child: _flashcardBack(colorScheme),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _flashcardFront(ColorScheme colorScheme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.r)),
      elevation: 0,
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            SizedBox(height: 45.h,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.flashcard.word,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.poppinsHeading2.copyWith(
                        fontSize: 40.sp,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 52.h),
                  SvgPicture.asset(
                    MyIcons.tap,
                    width: 34.w,
                    height: 34.w,
                    colorFilter: ColorFilter.mode(
                      colorScheme.outline,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(48.r),
                        topRight: Radius.circular(48.r),
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    context: context,
                    builder: (context){
                      return DraggableScrollableSheet(
                        initialChildSize: 0.6,
                        minChildSize: 0.4,
                        maxChildSize: 0.95,
                        expand: false,
                        builder: (context, scrollController){
                          return AiSupportBottomSheet(
                            key: ValueKey(widget.flashcard.id),
                            flashcard: widget.flashcard, 
                            controller: scrollController,);
                        }
                      );
                    }
                        
                  );
                },
                icon: SvgPicture.asset(
                  MyIcons.aiGemini,
                  height: 45.h,
                  width: 45.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _flashcardBack(ColorScheme colorScheme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.r)),
      elevation: 0,
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.flashcard.partOfSpeech ?? '',
              textAlign: TextAlign.center,
              style: MyTextStyle.poppinsLarge600.copyWith(
                color: colorScheme.outline,
              ),
            ),
            SizedBox(height: 12.h),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.flashcard.meaning,
                textAlign: TextAlign.center,
                style: MyTextStyle.poppinsLarge700.copyWith(
                  color: colorScheme.primary,
                  fontSize: 40.sp,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Text(
              widget.flashcard.example ?? '',
              textAlign: TextAlign.center,
              style: MyTextStyle.poppinsLarge400,
            ),
            SizedBox(height: 28.h),
            SvgPicture.asset(
              MyIcons.tap,
              width: 34.w,
              height: 34.w,
              colorFilter: ColorFilter.mode(
                colorScheme.outline,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
