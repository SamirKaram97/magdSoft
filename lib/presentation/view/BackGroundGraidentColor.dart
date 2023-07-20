import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class BackGroundGraidentColor extends StatelessWidget {
  const BackGroundGraidentColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                AppColor.primaryBlue.withOpacity(0.85),
                AppColor.primaryBlue.withOpacity(0)
              ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter)),
        )),
        Expanded(child: Container())
      ],
    );
  }
}