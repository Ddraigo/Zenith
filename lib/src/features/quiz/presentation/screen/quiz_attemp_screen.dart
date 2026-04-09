import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAttempScreen extends ConsumerWidget {
  const QuizAttempScreen({
    super.key, 
    required this.questions
  });
  final List<String> questions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;

    final userAnswer = TextEditingController();
    late bool _isError = false;

    return Container(
      padding: EdgeInsets.all(32.r),
      child: Column(
        children: [
          for (final item in questions)
          _questionCard(item,color),
          TextFormField(
            controller: userAnswer,
            cursorColor: color.primary,
            validator: (value) {
              _isError = value == null || value.isEmpty;
              return null;
            },
            decoration: InputDecoration(
              
              prefixIconColor: color.outlineVariant,
              prefixIcon: Icon(Icons.edit),
              hintText: 'Nhập câu trả lời',
              hintStyle: MyTextStyle.poppinsMedium600.copyWith(color: color.outline),
              errorText: _isError ? 'Không được bỏ trống đáp án' : null,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: color.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Kiểm tra đáp án"),
                Icon(
                  Icons.check_circle_outline_rounded, 
                color: color.onPrimary,),
            ],),
          )
        ],
      ),
    );
  }

  Widget _questionCard(String question, ColorScheme color){
    return Card(
      child: Column(
        children: [
          Text(
            'Câu hỏi',
            style: MyTextStyle.poppinsMedium400.copyWith(color: color.primary),
          ),
          Text(
            '$question trong tiếng Anh gì?',
            style: MyTextStyle.poppinsLarge600
          ),
        ],
      ),
    );
  }
}