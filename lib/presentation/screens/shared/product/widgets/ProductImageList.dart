import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';


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
    return SizedBox(
      height: getMediaQueryHeight(context, 126) ,
      child: ListView.builder(
          itemBuilder: (context, index) =>
              Center(
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: getMediaQueryWidth(context, 9)),
                  child: AppContainer(
                    spreadRadius:  5.sp,
                    radius:  20.sp,
                    blurRadius:  4.sp,
                    xOffset:  0.sp,
                    yOffset:  2.sp,
                    height: getMediaQueryHeight(context, 100) ,
                    width: getMediaQueryHeight(context, 100) ,
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