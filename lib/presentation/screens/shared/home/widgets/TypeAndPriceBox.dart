import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

import '../../../../../constants/constatnts.dart';
import '../../../../../constants/string_manger.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';

class TypeAndPriceBox extends StatelessWidget {
  const TypeAndPriceBox({
    Key? key,
    required this.productsList,
    required this.index,
  }) : super(key: key);

  
  final List<ProductModel> productsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getMediaQueryWidth(context, 9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productsList[index].company ?? "",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: getMediaQueryHeight(context, 3)),
          Text(productsList[index].name?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12.sp)),
          SizedBox(height: getMediaQueryHeight(context, 8)),
          Row(
            children: [
              Text((productsList[index].price??"")+" ${StringsManger.egp}",style:Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColor.black),),
              const Spacer(),
              Container(
                width: getMediaQueryWidth(context, 40),
                height: getMediaQueryHeight(context, 40),
                decoration: BoxDecoration(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp),
                  ),
                  gradient: LinearGradient(
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                      colors: [
                        AppColor.primaryBlue,
                        AppColor.primaryBlue.withOpacity(0.25)
                      ]),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}