import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manger.dart';
import 'package:magdsoft_flutter_structure/constants/constatnts.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product/widgets/BigPicImageContainer.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product/widgets/ProductImageList.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product/widgets/StoryInfoRow.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppButton.dart';

import '../../../view/AppContainer.dart';
import '../../../view/BackGroundGraidentColor.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel model;

  const ProductScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex=0;
  List<String> strings=[StringsManger.overview,StringsManger.spesification,StringsManger.review];

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

    return Scaffold(
      body: Stack(
        children: [
          const BackGroundGraidentColor(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w / designWidth * 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / designHeight * 50,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppContainer(
                      spreadRadius: h / designHeight * 5,
                      radius: h / designHeight * 15,
                      blurRadius: h / designHeight * 5,
                      xOffset: h / designHeight * 2,
                      yOffset: h / designHeight * 2,
                      height: h / designHeight * 50,
                      width: h / designHeight * 50,
                      child: const Icon(Icons.keyboard_arrow_left_outlined),
                    ),
                  ),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  Text(
                    widget.model.name ?? '',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: h / designHeight * 6,
                  ),
                  Text(
                    "Type: ${widget.model.type ?? ''}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: w/designWidth*15),
                  ),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  BigPicImageContainer(model: widget.model,),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  ProductImageList(model: widget.model),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  StoreInfoRow(model: widget.model),
                  SizedBox(height: h / designHeight * 25),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsManger.price,
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: w/designWidth*16),
                            ),
                            SizedBox(
                              height: h / designHeight * 7,
                            ),
                            Text(
                              "${widget.model.price ?? ""} ${StringsManger.egp}",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: w/designWidth*18),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: AppContainer(
                              xOffset: 0,
                              yOffset: h / designHeight * 2,
                              blurRadius: h / designHeight * 4,
                              spreadRadius: h / designHeight * 2,
                              radius: h / designHeight * 10,
                              height: h / designHeight * 44,
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd,
                                  colors: [
                                    AppColor.primaryBlue,
                                    AppColor.primaryBlue.withOpacity(0)
                                  ]),
                            child: Center(child: Text(StringsManger.addToCart,style:Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: w/designWidth*17),)),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: h/designWidth*35,
                  ),
                  Divider(thickness: h / designHeight * 1,color: AppColor.grey,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(int i=0;i<3;i++)
                        InkWell(
                          onTap: (){
                            setState(() {
                              selectedIndex=i;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [Text(strings[i],style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: w/designWidth*18,color: i==selectedIndex?AppColor.black:null),),if(selectedIndex==i)Container(height: 8,width: 8,decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColor.primaryBlue,AppColor.primaryBlue.withOpacity(0)],begin: AlignmentDirectional.topStart,end: AlignmentDirectional.bottomEnd),shape: BoxShape.circle,))],
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: h/designHeight*35,),
                  Text(widget.model.description??"",style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






