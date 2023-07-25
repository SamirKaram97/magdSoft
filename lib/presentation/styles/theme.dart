import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData getAppTheme(context){

  return ThemeData(
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.black,fontSize: 30.sp,fontWeight: FontWeight.w400),//welcome recommendec -- titles of pages with color
      displaySmall: TextStyle(color: AppColor.grey,fontSize: 10.sp,fontWeight: FontWeight.w400),//form filed--overview with size
      bodySmall: TextStyle(color: AppColor.grey,fontSize: 16.sp,fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(color: AppColor.white,fontSize: 20.sp,fontWeight: FontWeight.w400),//buttons --blue words with color --All with size
      labelMedium: TextStyle(color: AppColor.primaryBlue,fontSize: 17.sp,fontWeight: FontWeight.w400),// titles in help --razer with size
      displayMedium: TextStyle(color: AppColor.white,fontSize: 25.sp,fontWeight: FontWeight.w700),//only w700 title
      titleSmall: TextStyle(color: AppColor.primaryBlue.withOpacity(0.61),fontSize: 15.sp,fontWeight: FontWeight.w400),
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
          TextStyle(color: AppColor.white, fontSize: 8.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.sp)),
          //scaffoldBackgroundColor: AppColors.white,
        ),
      ));
}
