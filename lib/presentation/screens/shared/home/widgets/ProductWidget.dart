import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';


import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/assets_manger.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../constants/string_manger.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../router/app_router.dart';
import '../../../../styles/colors.dart';
import 'ImageBox.dart';
import 'TypeAndPriceBox.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.index,
    required this.productsList,
  }) : super(key: key);
  
  final int index;
  final List<ProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(w / designWidth * 10),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, RouteNames.productRoute,arguments: productsList[index]);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              w / designWidth * 20,
            ),
            boxShadow: getBoxShadowApp(h),
            color: AppColor.white,
          ),
          child: Column(
            children: [
              ImageBox( productsList: productsList, index: index),
              SizedBox(height: h/designHeight*5,),
              TypeAndPriceBox(productsList: productsList, index: index),
            ],
          ),
        ),
      ),
    );
  }
}



