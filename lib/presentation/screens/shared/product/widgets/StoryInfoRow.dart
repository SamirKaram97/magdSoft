import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';


import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/assets_manger.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppContainer.dart';
import '../proudect_screen.dart';
class StoreInfoRow extends StatelessWidget {
  const StoreInfoRow({
    Key? key, required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        radius: 10.sp,
        xOffset: 0,
        yOffset:  2.sp,
        blurRadius:  4.sp,
        spreadRadius:  5.sp,
        child: Padding(
          padding: EdgeInsets.all(getMediaQueryHeight(context, 5)),
          child: Row(
            children: [
              AppContainer(
                  height: getMediaQueryHeight(context, 55),
                  width: getMediaQueryWidth(context, 55),
                  radius: 10.sp,
                  xOffset: 0,
                  yOffset: 0,
                  blurRadius: 4.sp,
                  spreadRadius: 2.sp,
                  child: Image.asset(ImagesPath.acerll)),
              SizedBox(
                width: getMediaQueryWidth(context, 12),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.company??""+StringsManger.officialStore,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColor.black),
                  ),
                  Text(
                    StringsManger.viewStore,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize:12.sp),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: AppContainer(
                  spreadRadius:1.sp,
                  radius:5.sp ,
                  blurRadius:4.sp,
                  xOffset:0,
                  yOffset:2.sp ,
                  height:getMediaQueryHeight(context, 30) ,
                  width:getMediaQueryWidth(context, 30) ,
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
              ),
            ],
          ),
        ));
  }
}