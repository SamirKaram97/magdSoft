import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../constants/assets_manger.dart';
import '../../constants/constatnts.dart';

class SocialButton extends StatelessWidget {
  final String image;

  const SocialButton({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.all(w / designWidth * 14.0),
      child: Container(
          height: w / designWidth * 52,
          width: w / designWidth * 52,
          decoration: BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.circle,
            boxShadow: getBoxShadowApp(h),
          ),
          child: Padding(
            padding: EdgeInsets.all(w * 8.0 / designWidth),
            child: Image.asset(image, fit: BoxFit.fitHeight),
          )),
    );
  }
}
