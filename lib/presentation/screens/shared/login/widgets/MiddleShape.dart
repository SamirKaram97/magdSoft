import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

class MiddleShape extends StatelessWidget {
  const MiddleShape({
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
          width: double.infinity,
          height: h * .6,
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(60), topEnd: Radius.circular(60))),
        ));
  }
}