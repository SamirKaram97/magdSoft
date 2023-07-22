import 'package:flutter/material.dart';

import '../../constants/constatnts.dart';

class AppColor{
  static const Color primaryBlue = Color(0xFF0062BD);
  static const Color white = Color(0xFFFFFFFF);

  static const Color shadowColor = Color(0xFF00000040);
  static const Color grey = Color(0xFFB1B1B1);
  static const Color black = Color(0xFF464646);
  static const Color red = Colors.red;

}
 getBoxShadowApp(double h)=>[BoxShadow(
color: AppColor.shadowColor.withOpacity(0.25),
offset: Offset(h/designHeight*2,h/designHeight*2),
blurRadius: h/designHeight*8
)];