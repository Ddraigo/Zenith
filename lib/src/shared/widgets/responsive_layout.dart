
import 'package:flutter/material.dart';

class ResponsiveLayout {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    required this.mobile, 
    required this.tablet, 
    required this.desktop});

    static bool isMobile(BuildContext context)
     => MediaQuery.sizeOf(context).width < 650;

    static bool isTablet(BuildContext context)
     => MediaQuery.sizeOf(context).width < 1100 &&
     MediaQuery.sizeOf(context).width >= 650;

    static bool isDesktop(BuildContext context)
     => MediaQuery.sizeOf(context).width >= 1100;
  
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth >= 1100){
          return desktop;
        }
        else if(constraints.maxWidth >= 650 ){
          return tablet ?? desktop;
        }
        else{
          return mobile;
        }
      },
    );
  }
}
