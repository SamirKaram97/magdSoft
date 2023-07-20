import 'package:flutter/material.dart';

import '../../business_logic/help_bloc/bloc.dart';
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
      decoration: BoxDecoration(boxShadow: [BoxShadow(color: AppColor.shadowColor.withOpacity(0.25),offset: Offset(w/430*2, w/430*2),blurRadius: w/430*8,spreadRadius: w/430*2),]),
      child: Card(
        child: Padding(
          padding:  padding,
          child:child,
        ),
      ),
    );
  }
}