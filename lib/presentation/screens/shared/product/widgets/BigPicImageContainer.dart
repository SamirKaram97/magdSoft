import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppContainer.dart';
import '../proudect_screen.dart';


class BigPicImageContainer extends StatelessWidget {
  const BigPicImageContainer({
    Key? key, required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return AppContainer(
      spreadRadius: h / designHeight * 5,
      radius: h / designHeight * 20,
      blurRadius: h / designHeight * 4,
      xOffset: h / designHeight * 0,
      yOffset: h / designHeight * 2,
      height: h / designHeight * 300,
      width: double.infinity,
      child: Image.network(model.image!, fit: BoxFit.contain),
    );
  }
}