import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

  Widget _logo() {
    return SvgPicture.asset(MyImages.logoIcon, fit: BoxFit.contain);
  }

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.image,
    this.subTitle,
    this.index = 0,
  });

  final String title, image;
  final String? subTitle;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _logo(),
        Expanded(child: SvgPicture.asset(image, fit: BoxFit.contain)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: MyTextStyle.poppinsHeading1,
        ),
        Text(
          subTitle ?? '',
          style: MyTextStyle.poppinsMedium400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class OnBoardingSkipedPage extends StatelessWidget {
  const OnBoardingSkipedPage({
    super.key,
    required this.title,
    required this.image,
  });

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 24.h,
      children: [
        _logo(),
        Expanded(child: SvgPicture.asset(image, fit: BoxFit.contain)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: MyTextStyle.poppinsHeading1,
        ),
        ButtonCustom(
          type: ButtonType.elevated, 
          onPressed: (){},
          label: 'Login',
        ),
        ButtonCustom(
          type: ButtonType.elevated, 
          onPressed: (){},
          label: 'Sign Up',
        ),
      ],
    );
  }


}
