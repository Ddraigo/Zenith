import 'package:flutter/material.dart';

import '../../../configs/themes/text_style.dart';

Widget header({required String title, String? subTitle}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: MyTextStyle.poppinsHeading2,),
                  if(subTitle != null && subTitle.isNotEmpty)
                  Text(subTitle, style: MyTextStyle.poppinsLarge400,),
                ],
              
    );
  }