import 'package:flutter/material.dart';

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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: w / designWidth * 9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productsList[index].company ?? "",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: w/designWidth*18),
          ),
          SizedBox(height: h / designHeight * 3),
          Text(productsList[index].name?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12)),
          SizedBox(height: h / designHeight * 8),
          Row(
            children: [
              Text((productsList[index].price??"")+" ${StringsManger.egp}",style:Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColor.black),),
              const Spacer(),
              Container(
                width: w / designWidth * 40,
                height: h / designHeight * 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
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