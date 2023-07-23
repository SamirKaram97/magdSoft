import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppContainer.dart';
import '../proudect_screen.dart';
class ProductImageList extends StatelessWidget {
  const ProductImageList({
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
    return SizedBox(
      height: h / designHeight * 126,
      child: ListView.builder(
          itemBuilder: (context, index) =>
              Center(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: w / designWidth * 9),
                  child: AppContainer(
                    spreadRadius: h / designHeight * 5,
                    radius: h / designHeight * 20,
                    blurRadius: h / designHeight * 4,
                    xOffset: h / designHeight * 0,
                    yOffset: h / designHeight * 2,
                    height: h / designHeight * 100,
                    width: w / designWidth * 100,
                    child:
                    Image.network(model.image!, fit: BoxFit.contain),
                  ),
                ),
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 6),
    );
  }
}