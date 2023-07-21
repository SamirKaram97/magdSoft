
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constatnts.dart';
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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(w/designWidth*10),
        color: AppColor.white,
        boxShadow: getBoxShadowApp(h)
      ),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if(value!=null&&value.isEmpty)
            {
              return "please enter a value for this box";
            }
          return null;
        },
          keyboardType: textInputType,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              contentPadding:
                  EdgeInsetsDirectional.all(w / designWidth * 11))),
    );
  }
}