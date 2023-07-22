import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../constants/constatnts.dart';
import '../../../../styles/colors.dart';

class OtpFormFiled extends StatelessWidget {
  const OtpFormFiled({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.isLast,
    required this.isFirst,
  }) : super(key: key);

  final TextEditingController controller;
  
  final TextInputType? textInputType;
  final bool? isLast;
  final bool? isFirst;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(w / designWidth * 9.5),
      child: Container(
        width: w / designWidth * 70,
        height: w / designWidth * 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(w / designWidth * 15),
            color: AppColor.white,
            boxShadow: getBoxShadowApp(h)),
        child: Center(
          child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "please enter a value for this box";
                }
                return null;
              },
              textAlign: TextAlign.center,
              keyboardType: textInputType,
              onChanged: (value) {
                if (value.isNotEmpty && isLast != true) {
                  FocusScope.of(context).nextFocus();
                } else if ((value.isEmpty && isFirst != true)) {
                  FocusScope.of(context).previousFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.all(w / designWidth * 9.5))),
        ),
      ),
    );
  }
}