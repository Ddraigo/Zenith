import 'package:app_demo/src/routes/app_router.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          spacing: 24,
          children: [
            _logo(),
            _progress(),
            _category(),
            _topic(),
      
      
          ],
        ),
      ),
    );
  }
  
  Widget _progress() {
    return Card.outlined(

    );
  }
  
  Widget _logo() {
    return Container(
      child: Row(
        children: [

        ],
      ),
    );
  }
  
  Widget _category() {
    return Container(

    );
  }
  
  Widget _topic() {
    return Container(

    );
  }
}

