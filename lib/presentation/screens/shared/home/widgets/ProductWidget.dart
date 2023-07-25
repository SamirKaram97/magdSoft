import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';


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

    return Padding(
      padding: EdgeInsets.all(getMediaQueryWidth(context, 10)),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, RouteNames.productRoute,arguments: productsList[index]);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.sp,
            ),
            boxShadow: getBoxShadowApp(),
            color: AppColor.white,
          ),
          child: Column(
            children: [
              ImageBox( productsList: productsList, index: index),
              SizedBox(height:getMediaQueryHeight(context, 5)),
              TypeAndPriceBox(productsList: productsList, index: index),
            ],
          ),
        ),
      ),
    );
  }
}



