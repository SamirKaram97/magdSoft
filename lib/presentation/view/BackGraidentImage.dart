import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manger.dart';

import '../styles/colors.dart';

class BackGraidentImage extends StatelessWidget {
  const BackGraidentImage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        children: [
          Image.asset(
            ImagesPath.pic,
            height: h / 2,
            width: w,
          ),
          Container(color: AppColor.primaryBlue.withOpacity(0.5)),
        ],
      ),
    );
  }
}