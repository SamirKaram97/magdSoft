import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../constants/assets_manger.dart';
import '../../constants/constatnts.dart';

class SocialButton extends StatelessWidget {
  final String image;

  const SocialButton({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getMediaQueryWidth(context, 14)),
      child: Container(
          height: getMediaQueryHeight(context, 52),
          width: getMediaQueryWidth(context, 52),
          decoration: BoxDecoration(
            color: AppColor.white,
            shape: BoxShape.circle,
            boxShadow: getBoxShadowApp(),
          ),
          child: Padding(
            padding: EdgeInsets.all(getMediaQueryWidth(context, 8)),
            child: Image.asset(image, fit: BoxFit.fitHeight),
          )),
    );
  }
}
