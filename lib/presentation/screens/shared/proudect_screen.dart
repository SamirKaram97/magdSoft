import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manger.dart';
import 'package:magdsoft_flutter_structure/constants/constatnts.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppButton.dart';

import '../../view/AppContainer.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel model;

  const ProductScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex=0;
  List<String> strings=["Overview","Spesification","Review"];

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
          BackGroundGraidentColor(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w / designWidth * 33),
            child: SingleChildScrollView(
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
                      child: Icon(Icons.keyboard_arrow_left_outlined),
                    ),
                  ),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  Text(
                    widget.model.name ?? '',
                    style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontSize: w / designWidth * 25,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: h / designHeight * 6,
                  ),
                  Text(
                    "Type: ${widget.model.type ?? ''}",
                    style: GoogleFonts.inter(
                        color: AppColor.white,
                        fontSize: w / designWidth * 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  _bigPicImageContainer(h),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  _productImagesList(h, w),
                  SizedBox(
                    height: h / designHeight * 16,
                  ),
                  _storeInfoRow(h, w),
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
                              "Price",
                              style: GoogleFonts.inter(
                                  fontSize: w / designWidth * 16,
                                  color: AppColor.grey),
                            ),
                            SizedBox(
                              height: h / designHeight * 7,
                            ),
                            Text(
                              "${widget.model.price ?? ""} EGP",
                              style: GoogleFonts.inter(
                                  fontSize: w / designWidth * 18),
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
                            child: Center(child: Text("Add To Cart",style: GoogleFonts.inter(color: AppColor.white,fontSize: w/designWidth*17),)),
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
                            children: [Text(strings[i]),if(selectedIndex==i)Container(height: 8,width: 8,decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColor.primaryBlue,AppColor.primaryBlue.withOpacity(0)],begin: AlignmentDirectional.topStart,end: AlignmentDirectional.bottomEnd),shape: BoxShape.circle,))],
                          ),
                        )
                    ],
                  ),
                  SizedBox(height: h/designHeight*35,),
                  Text(widget.model.description??"",style: GoogleFonts.inter(color: AppColor.grey,fontSize: w/designWidth*16),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppContainer _storeInfoRow(double h, double w) {
    return AppContainer(
        radius: h / designHeight * 10,
        xOffset: 0,
        yOffset: h / designHeight * 2,
        blurRadius: h / designHeight * 4,
        spreadRadius: h / designHeight * 5,
        child: Padding(
          padding: EdgeInsets.all(h / designHeight * 5),
          child: Row(
            children: [
              AppContainer(
                  height: h / designHeight * 55,
                  width: w / designWidth * 55,
                  radius: h / designHeight * 10,
                  xOffset: 0,
                  yOffset: 0,
                  blurRadius: h / designHeight * 4,
                  spreadRadius: h / designHeight * 2,
                  child: Image.asset(ImagesPath.acerll)),
              SizedBox(
                width: w / designWidth * 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.company ?? "" + "Offical Store",
                    style: GoogleFonts.inter(fontSize: w / designWidth * 17),
                  ),
                  Text(
                    "View Store",
                    style: GoogleFonts.inter(
                        fontSize: w / designWidth * 12, color: AppColor.grey),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: AppContainer(
                  spreadRadius: h / designHeight * 1,
                  radius: h / designHeight * 5,
                  blurRadius: h / designHeight * 4,
                  xOffset: h / designHeight * 0,
                  yOffset: h / designHeight * 2,
                  height: h / designHeight * 30,
                  width: h / designHeight * 30,
                  child: Icon(Icons.keyboard_arrow_left_outlined),
                ),
              ),
            ],
          ),
        ));
  }

  AppContainer _bigPicImageContainer(double h) {
    return AppContainer(
      spreadRadius: h / designHeight * 5,
      radius: h / designHeight * 20,
      blurRadius: h / designHeight * 4,
      xOffset: h / designHeight * 0,
      yOffset: h / designHeight * 2,
      height: h / designHeight * 300,
      width: double.infinity,
      child: Image.network(widget.model.image!, fit: BoxFit.contain),
    );
  }

  SizedBox _productImagesList(double h, double w) {
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
                    Image.network(widget.model.image!, fit: BoxFit.contain),
                  ),
                ),
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 6),
    );
  }
}
