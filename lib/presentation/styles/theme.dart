import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/constants/constatnts.dart';

import 'colors.dart';

ThemeData getAppTheme(context){
  double hr=MediaQuery.of(context).size.height/designHeight;
  double wr=MediaQuery.of(context).size.width/designWidth;
  return ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.black,fontSize: wr*30,fontWeight: FontWeight.w400),//welcome recommendec -- titles of pages with color
      displaySmall: TextStyle(color: AppColor.grey,fontSize: wr*10,fontWeight: FontWeight.w400),//form filed--overview with size
      bodySmall: TextStyle(color: AppColor.grey,fontSize: wr*16,fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(color: AppColor.white,fontSize: wr*20,fontWeight: FontWeight.w400),//buttons --blue words with color --All with size
      labelMedium: TextStyle(color: AppColor.primaryBlue,fontSize: wr*17,fontWeight: FontWeight.w400),// titles in help --razer with size
      displayMedium: TextStyle(color: AppColor.white,fontSize: wr*25,fontWeight: FontWeight.w700),//only w700 title
      titleSmall: TextStyle(color: AppColor.primaryBlue.withOpacity(0.61),fontSize: wr*15,fontWeight: FontWeight.w400),
    ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          //statusBarColor: AppColors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity,
              MediaQuery.sizeOf(context).height * .05),
          textStyle:
          TextStyle(color: AppColor.white, fontSize: 8),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
          //scaffoldBackgroundColor: AppColors.white,
        ),
      ));
}
