import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppContainer.dart';
import '../proudect_screen.dart';


class BigPicImageContainer extends StatelessWidget {
  const BigPicImageContainer({
    Key? key, required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return AppContainer(
      spreadRadius:  5.sp,
      radius:  2.0.sp,
      blurRadius:  4.sp,
      xOffset:  0.sp,
      yOffset:  2.sp,
      height: getMediaQueryHeight(context, 300) ,
      width: double.infinity,
      child: Image.network(model.image!, fit: BoxFit.contain),
    );
  }
}