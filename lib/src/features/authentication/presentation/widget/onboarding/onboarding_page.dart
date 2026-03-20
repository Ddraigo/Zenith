import 'package:app_demo/configs/themes/text_style.dart';
import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.invertColors,
    required this.shape,
    required this.onLeft,
    index = 0,
  });

  final String title, shape, image, subTitle;
  final bool invertColors, onLeft;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
                shape,
                fit: BoxFit.contain,
            ),
            Expanded(
              child: SvgPicture.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(10.w, 20.h, 10.w, 5.h),
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: MyTextStyle.headingH1.copyWith(
                    color: colorScheme.onSurface,
                  )),
            ),
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(10.w, 0, 10.w, 90.h),
              child: Text(
                subTitle,
                style: MyTextStyle.bodyTextNormal.copyWith(
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Positioned(
          top: 110.h,
          left: 0.w,
          right: 0.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: onLeft ? Alignment.centerLeft : Alignment.centerRight,
              child: IntrinsicWidth(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: onLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        MyImages.appIcon,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                            invertColors ? colorScheme.primary: colorScheme.onPrimary,
                            BlendMode.srcIn
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'eCommerce Shop',
                        style: MyTextStyle.headingH3.copyWith(
                          color: invertColors ? colorScheme.primary: colorScheme.onPrimary,
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 1,
                        color: invertColors ? colorScheme.inverseSurface : colorScheme.onInverseSurface,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Professional App for your \neCommerce business',
                        style: MyTextStyle.bodyTextSmallNormal.copyWith(
                          color: invertColors ? colorScheme.inverseSurface : colorScheme.onInverseSurface,
                        ),
                        textAlign: onLeft ? TextAlign.left : TextAlign.right,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
