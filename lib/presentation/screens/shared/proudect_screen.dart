import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manger.dart';
import 'package:magdsoft_flutter_structure/constants/constatnts.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel model;

  const ProductScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h / designHeight * 50,
                ),
                InkWell(
                  onTap: (){
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
                Text(widget.model.name??'', style: GoogleFonts.inter(
                    color: AppColor.white,
                    fontSize: w / designWidth * 25,
                    fontWeight: FontWeight.w700),),
                SizedBox(
                  height: h / designHeight * 6,
                ),
                Text("Type: ${widget.model.type??''}", style: GoogleFonts.inter(
                    color: AppColor.white,
                    fontSize: w / designWidth * 15,
                    fontWeight: FontWeight.w400),),
                SizedBox(
                  height: h / designHeight * 16,
                ),
                AppContainer(
                  spreadRadius: h / designHeight * 5,
                  radius: h / designHeight * 20,
                  blurRadius: h / designHeight * 4,
                  xOffset: h / designHeight * 0,
                  yOffset: h / designHeight * 2,
                  height: h / designHeight * 300,
                  width: double.infinity,
                  child: Image.network(
                      widget.model.image!, fit: BoxFit.contain),
                ),
                SizedBox(
                  height: h / designHeight * 16,
                ),
                SizedBox(
                  height: h / designHeight * 126,
                  child: ListView.separated(itemBuilder: (context, index) =>
                      Center(
                        child: AppContainer(
                          spreadRadius: h / designHeight * 5,
                          radius: h / designHeight * 20,
                          blurRadius: h / designHeight * 4,
                          xOffset: h / designHeight * 0,
                          yOffset: h / designHeight * 2,
                          height: h / designHeight * 100,
                          width: w / designWidth * 100,
                          child: Image.network(widget.model.image!, fit: BoxFit
                              .contain),
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: w / designWidth * 14,),
                      itemCount: 6),
                ),
                SizedBox(
                  height: h / designHeight * 16,
                ),
                AppContainer(child:Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(h / designHeight * 5),
                      child: AppContainer(height: h / designHeight * 55,width: w / designWidth * 55,child:Image.asset(ImagesPath.acerll),radius: h / designHeight * 10, xOffset: 0, yOffset: 0, blurRadius: h / designHeight * 4, spreadRadius: h / designHeight * 2),
                    ),

                  ],
                ), radius: h / designHeight * 10,
                    xOffset: 0,
                    yOffset: h / designHeight * 2,
                    blurRadius: h / designHeight * 4,
                    spreadRadius: h / designHeight * 5)


              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  AppContainer({this.height,
    this.width,
    Key? key,
    required this.radius,
    required this.xOffset,
    required this.yOffset,
    required this.blurRadius,
    this.child, required this.spreadRadius})
      : super(key: key);
  double? width;
  double? height;
  final double radius;
  final double xOffset;
  final double yOffset;
  final double blurRadius;
  final double spreadRadius;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
                color: AppColor.shadowColor.withOpacity(0.25),
                offset: Offset(xOffset, yOffset),
                blurRadius: blurRadius, spreadRadius: spreadRadius)
          ],
          color: AppColor.white,
        ));
  }
}
