import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

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

    return Padding(
      padding: EdgeInsets.all(getMediaQueryWidth(context, 9.5) ),
      child: Container(
        width: getMediaQueryWidth(context, 70) ,
        height: getMediaQueryHeight(context, 80) ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getMediaQueryWidth(context, 15) ),
            color: AppColor.white,
            boxShadow: getBoxShadowApp()),
        child: Center(
          child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return StringsManger.validate;
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
                  contentPadding: EdgeInsetsDirectional.all(getMediaQueryWidth(context, 9.5) ))),
        ),
      ),
    );
  }
}