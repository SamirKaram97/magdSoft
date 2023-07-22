import 'package:flutter/cupertino.dart';

import '../styles/colors.dart';

class AppContainer extends StatelessWidget {
  AppContainer(
      {this.height,
      this.width,
      Key? key,
      required this.radius,
        this.color,
      required this.xOffset,
      required this.yOffset,
      required this.blurRadius,this.gradient,
      this.child,
      required this.spreadRadius})
      : super(key: key);
  double? width;
  double? height;
  final double radius;
  final double xOffset;
  final double yOffset;
  final double blurRadius;
  final double spreadRadius;
  Widget? child;
  Gradient? gradient;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.25),
                offset: Offset(xOffset, yOffset),
                blurRadius: blurRadius,
                spreadRadius: spreadRadius)
          ],
          color: color??AppColor.white,
        ));
  }
}