import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/assets_manger.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../router/app_router.dart';
import '../../../../styles/colors.dart';

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
            width: w / designWidth * 168,
            height: h / designHeight * 239,
            child: Stack(children: [
              Container(
                width: w / designWidth * 168,
                height: h / designHeight * 239,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    w / designWidth * 20,
                  ),
                  boxShadow: getBoxShadowApp(h),
                  color: AppColor.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: w / designWidth * 9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsList[index].company ?? "",
                        style: GoogleFonts.inter(
                            color: AppColor.primaryBlue,
                            fontSize: w / designWidth * 18),
                      ),
                      SizedBox(height: h / designHeight * 3),
                      Text(productsList[index].name ?? "",
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: w / designWidth * 12)),
                      SizedBox(height: h / designHeight * 8),
                      Row(
                        children: [
                          Text(productsList[index].price ?? ""),
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
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                      width: w / designWidth * 168,
                      height: h / designHeight * 142,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          w / designWidth * 20,
                        ),
                        boxShadow: getBoxShadowApp(h),
                        color: AppColor.white,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(w / designWidth * 5),
                            child: Image(
                              image:
                                  NetworkImage(productsList[index].image ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: InkWell(
                              onTap: () async {
                                await BlocProvider.of<ProductsBloc>(context)
                                    .addToFav(productsList[index].id!);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(h / designHeight * 10),
                                child: Image(
                                  width: h / designHeight * 20,
                                  height: h / designHeight * 20,
                                  image: Svg(
                                      BlocProvider.of<ProductsBloc>(context)
                                              .favList
                                              .contains(productsList[index].id!)
                                          ? ImagesPath.fav_red
                                          : ImagesPath.fav),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ])),
      ),
    );
  }
}