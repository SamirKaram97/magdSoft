import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/help_bloc/bloc.dart';
import '../../constants/constatnts.dart';
import '../styles/colors.dart';

class AppCard extends StatelessWidget {
    const AppCard({
    Key? key,
    required this.child,required this.padding
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: AppColor.shadowColor.withOpacity(0.25),offset: Offset(2.sp,2.sp),blurRadius: 8.sp,spreadRadius: 2.sp),]),
      child: Card(
        child: Padding(
          padding:  padding,
          child:child,
        ),
      ),
    );
  }
}