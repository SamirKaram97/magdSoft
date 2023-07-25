import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manger.dart';

import '../styles/colors.dart';

class BackGraidentImage extends StatelessWidget {
  const BackGraidentImage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        children: [
          Image.asset(
            ImagesPath.pic,
            height:MediaQuery.of(context).size.height/ 2,
            width: double.infinity,
          ),
          Container(color: AppColor.primaryBlue.withOpacity(0.5)),
        ],
      ),
    );
  }
}