import 'package:flutter/material.dart';

class ThemeColor {
  static const MaterialColor selectedColor = MaterialColor(
    0xff009984, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff009984), //10%
      100: Color(0xff009984), //20%
      200: Color(0xff009984), //30%
      300: Color(0xff009984), //40%
      400: Color(0xff009984), //50%
      500: Color(0xff009984), //60%
      600: Color(0xff009984), //70%
      700: Color(0xff009984), //80%
      800: Color(0xff009984), //90%
      900: Color(0xff009984), //100%
    },
  );
} // you can define define int 500 as the default shade and add your lighter tints above and darker tints below.
