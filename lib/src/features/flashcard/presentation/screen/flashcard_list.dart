import 'package:app_demo/src/features/flashcard/domain/flashcard_model.dart';
import 'package:app_demo/src/features/flashcard/presentation/screen/flashcard_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'dart:math' as math;

final flashcardIndexProvider = StateProvider<int>((ref) => 0);

class FlashcardList extends StatelessWidget {
  const FlashcardList({super.key, required this.flashcards, this.onSwiped});
  final List<FlashcardModel> flashcards;
  final Function(int index)? onSwiped;

  @override
  Widget build(BuildContext context) {
    
    if(flashcards.isEmpty){
      return const Center(child: Text('Không tìm thấy dữ liệu'));
    }
    
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.withOpacity(0.1),
      ),
      child: CardSwiper(
        cardsCount: flashcards.length,
        numberOfCardsDisplayed: math.min(3, flashcards.length),
        backCardOffset: const Offset(0, 40),
      
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
}

