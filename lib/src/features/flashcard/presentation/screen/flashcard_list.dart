import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/themes/text_style.dart';


class FlashcardList extends StatelessWidget {
  const FlashcardList({super.key, required this.flashcards, this.onSwiped});
  final List<FlashcardModel> flashcards;
  final Function(int index)? onSwiped;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    if(flashcards.isEmpty){
      return _flashcardEmpty(color);
    }
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.withValues(alpha: 0.1),
      ),
      child: CardSwiper(
        cardsCount: flashcards.length,
        numberOfCardsDisplayed: math.min(3, flashcards.length),
        backCardOffset: const Offset(0, 20),
      
        cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage){
          final flashcard = flashcards[index];
          return FlashcardItem(
            key: ValueKey(flashcard.id),
            flashcard: flashcard);
        },
        onSwipe: (previousIndex, currentIndex, direction) {
          if(onSwiped != null && currentIndex != null){
            onSwiped!(currentIndex);
          }
          return true;
        },
        allowedSwipeDirection: AllowedSwipeDirection.only(left: true, right: true),
      ),
    );
  }

  Widget _flashcardEmpty(ColorScheme colorScheme) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36.r),
        ),
        elevation: 0,
        color: colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(30.r),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Không có từ vựng nào',
                  textAlign: TextAlign.center,
                  style: MyTextStyle.poppinsHeading2.copyWith(
                    fontSize: 40.sp,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: 52.h),
              Text(
                'Quay lại sau',
                style: MyTextStyle.poppinsMedium400.copyWith(
                  color: colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

