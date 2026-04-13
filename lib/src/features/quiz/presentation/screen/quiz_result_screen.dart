import 'package:app_demo/configs/themes/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizResultScreen extends ConsumerWidget {
  const QuizResultScreen({super.key, this.quizAttempId = ''});
  final String quizAttempId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text('Kết quả'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20.h,
            children: [
              _summaryResult(color),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    
                  }
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  )
                ),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Làm lại'),
              ),
              OutlinedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  )
                ),
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                icon: const Icon(Icons.home_rounded),
                label: const Text('Về trang chủ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryResult(ColorScheme color) {
    return Row(
              spacing: 16.h,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: color.onPrimary,
                    ),

                    height: 160.h,
                    width: 160.w,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 130.h,
                          width: 130.w,
                          child: CircularProgressIndicator(
                            strokeCap: StrokeCap.round,

                            strokeWidth: 10,
                            backgroundColor: color.outline.withOpacity(0.4),
                            value: 8 / 10,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              color.primary,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "80%",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: color.primary,
                              ),
                            ),
                            Text(
                              "8 OUT OF 10",
                              style: MyTextStyle.poppinsSmall500.copyWith(
                                color: color.outline.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 160.h,
                    child: Column(
                      spacing: 8.h,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: color.onPrimary,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: const Color.fromARGB(
                                    255,
                                    40,
                                    116,
                                    41,
                                  ),
                                ),
                                Text('8', style: MyTextStyle.poppinsLarge),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: color.onPrimary,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.cancel_rounded,
                                  color: color.error,
                                ),
                                Text('2', style: MyTextStyle.poppinsLarge),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
  }
}
