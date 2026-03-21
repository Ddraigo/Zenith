import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

  Widget _logo() {
    return SvgPicture.asset(MyImages.logoSmall, fit: BoxFit.contain);
  }
}
