import 'package:flutter/material.dart';

class MyHelper{

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}