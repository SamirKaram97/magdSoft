import 'package:flutter/material.dart';

import '../../business_logic/help_bloc/bloc.dart';
import '../../constants/constatnts.dart';
import '../styles/colors.dart';

class AppCard extends StatelessWidget {
    const AppCard({
    Key? key,
    required this.child,required this.padding
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(boxShadow: getBoxShadowApp(h)),
      child: Card(
        child: Padding(
          padding:  padding,
          child:child,
        ),
      ),
    );
  }
}