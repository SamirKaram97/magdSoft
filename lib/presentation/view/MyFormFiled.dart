
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';

import '../../constants/constatnts.dart';
import '../responsive.dart';
import '../styles/colors.dart';

class MyFormFiled extends StatelessWidget {
   MyFormFiled({
    Key? key,
     required this.textInputType, required this.controller, required this.hint,
    
  }) : super(key: key);
  final TextInputType textInputType;
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColor.white,
        boxShadow: getBoxShadowApp()
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(value!=null&&value.isEmpty)
            {
              return StringsManger.validate;
            }
          return null;
        },
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.displaySmall,
              border: InputBorder.none,
              hintText: hint,
              contentPadding:
                  EdgeInsetsDirectional.all(getMediaQueryWidth(context,11)),
    )));
  }
}