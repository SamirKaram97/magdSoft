import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/assets_manger.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
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
    return Container(
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
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: productsList[index].image ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>Icon(Icons.error),
                ),
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
        ));
  }
}