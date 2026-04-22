import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/themes/text_style.dart';
import '../../../flashcard/domain/flashcard_model.dart';
import '../../domain/flashcard_ai_support_model.dart';

Widget audioButton(
  ColorScheme color,
  String phonetic, {
  VoidCallback? onPressed,
}) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      backgroundColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
    ),
    icon: Icon(Icons.volume_up_outlined, color: color.primary),
    label: Text(
      phonetic,
      style: MyTextStyle.poppinsMedium600.copyWith(height: 1),
    ),
  );
}

Widget commonPhrases(ColorScheme color, List<String> commonPhrases) {
  return Column(
    children: [
      Row(
        spacing: 8.w,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary,
            ),
            child: Icon(Icons.fact_check_outlined, color: color.onPrimary),
          ),
          Expanded(
            child: Text("Cụm từ hay gặp", style: MyTextStyle.poppinsLarge600),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Wrap(
        spacing: 4.h,
        runSpacing: 4.h,
        children: commonPhrases.map((item) {
          return Container(
            margin: EdgeInsets.all(8.h),
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade100.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              item,
              textAlign: TextAlign.center,
              style: MyTextStyle.poppinsMedium400.copyWith(
                color: color.primary,
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}

Widget exmaple(List<ExampleItemModel> examples, ColorScheme color) {
  return Column(
    spacing: 8.h,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Ví dụ thực tế', style: MyTextStyle.poppinsLarge600),
      Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: examples.map((item) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4.h),
            padding: EdgeInsets.only(right: 8.h),
            decoration: BoxDecoration(
              color: Colors.purple.shade100.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 4.h, 0, 4.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: IntrinsicHeight(
                  child: Row(
                    spacing: 8.w,
                    children: [
                      Container(width: 5.w, color: color.primary),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 8.h,
                            bottom: 8.h,
                            left: 8.w,
                          ),
                          child: Text.rich(
                            TextSpan(
                              style: MyTextStyle.poppinsMedium400,
                              children: [
                                TextSpan(
                                  text: '"${item.en}"',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                TextSpan(text: '\n${item.vi}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  );
}

Column synonyms(ColorScheme color, List<String> synonyms) {
  return Column(
    children: [
      Row(
        spacing: 8.w,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary,
            ),
            child: Icon(Icons.change_circle_outlined, color: color.onPrimary),
          ),
          Expanded(
            child: Text("Từ đồng nghĩa", style: MyTextStyle.poppinsLarge600),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Wrap(
        spacing: 4.h,
        runSpacing: 4.h,
        children: synonyms
            .map(
              (item) => buildItemChip(
                item,
                color,
                Colors.purple.shade100.withValues(alpha: 0.5),
              ),
            )
            .toList(),
      ),
    ],
  );
}

Widget antonyms(FlashcardAiSupportModel data, ColorScheme color) {
  return Column(
    children: [
      Row(
        spacing: 8.w,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary,
            ),
            child: Icon(Icons.book_outlined, color: color.onPrimary),
          ),
          Expanded(
            child: Text("Từ trái nghĩa", style: MyTextStyle.poppinsLarge600),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Wrap(
        spacing: 4.h,
        runSpacing: 4.h,
        children: data.antonyms!
            .map((item) => buildItemChip(item, color, Colors.purple.shade100))
            .toList(),
      ),
    ],
  );
}

Widget buildItemChip(String item, ColorScheme color, Color decorationColor) {
  return Container(
    margin: EdgeInsets.all(8.h),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: decorationColor,
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Text(
      item,
      textAlign: TextAlign.center,
      style: MyTextStyle.poppinsMedium400.copyWith(color: color.primary),
    ),
  );
}

Widget whenToUse(ColorScheme color, FlashcardAiSupportModel data) {
  return Column(
    children: [
      Row(
        spacing: 8.w,
        children: [
          Container(
            padding: EdgeInsets.all(4.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary,
            ),
            child: Icon(
              Icons.check_circle_outline_outlined,
              color: color.onPrimary,
            ),
          ),
          Expanded(
            child: Text('Khi nào dùng', style: MyTextStyle.poppinsLarge600),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Wrap(
        children: data.whenToUse.map((item) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.w,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(child: Text(item, style: MyTextStyle.poppinsMedium)),
              ],
            ),
          );
        }).toList(),
      ),
    ],
  );
}

Widget menoryTip(ColorScheme color, String memoryTip) {
  return Column(
    spacing: 8.h,
    children: [
      Row(
        spacing: 8.w,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary,
            ),
            child: Icon(
              Icons.tips_and_updates_outlined,
              color: color.onPrimary,
            ),
          ),
          Expanded(
            child: Text(" Mẹo dễ nhớ", style: MyTextStyle.poppinsLarge600),
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.yellow.shade100.withValues(alpha: 0.5),
          border: Border.fromBorderSide(
            BorderSide(width: 1.w, color: Colors.yellow.shade100),
          ),
        ),
        child: Text(memoryTip, style: MyTextStyle.poppinsMedium400),
      ),
    ],
  );
}

Widget wordMeaning(ColorScheme color, String meaning) {
  return Column(
    spacing: 8.h,
    children: [
      Row(
        spacing: 8.w,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.primary,
            ),
            child: Icon(Icons.contact_support_outlined, color: color.onPrimary),
          ),
          Expanded(
            child: Text('Nghĩa dễ hiểu', style: MyTextStyle.poppinsLarge600),
          ),
        ],
      ),

      Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(meaning, style: MyTextStyle.poppinsMedium),
      ),
    ],
  );
}

Widget word(ColorScheme color, FlashcardModel flashcard) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    spacing: 10.w,
    children: [
      Text(
        flashcard.word,
        style: MyTextStyle.poppinsHeading2.copyWith(color: color.primary),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Colors.green.shade300.withValues(alpha: 0.8),
            width: 1,
          ),
        ),
        child: Text(
          flashcard.partOfSpeech ?? 'N/A',
          style: MyTextStyle.poppinsMedium.copyWith(
            color: color.inverseSurface,
          ),
        ),
      ),
    ],
  );
}
