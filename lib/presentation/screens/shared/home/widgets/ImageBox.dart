import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../business_logic/home_bloc/states.dart';
import '../../../../../business_logic/layout_cubit/layout_cubit.dart';
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
    FavController controller=FavController();

    return Container(
        height: getMediaQueryHeight(context, 142),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getMediaQueryWidth(context, 20),
          ),
          boxShadow: getBoxShadowApp(),
          color: AppColor.white,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(getMediaQueryWidth(context, 5)),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: productsList[index].image ?? "",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: InkWell(
                onTap: () async {
                  BlocProvider.of<ProductsBloc>(context).changeFav(context, productsList[index].id??0);
                },
                child: Padding(
                  padding: EdgeInsets.all(getMediaQueryWidth(context, 10)),
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.linear,
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                      child: LayoutCubit.get(context)
                          .favList
                          .contains(productsList[index].id!)
                          ? Image(
                        key: const ValueKey("red"),
                        width: getMediaQueryHeight(context, 20),
                        height: getMediaQueryHeight(context, 20),
                        image: const Svg(ImagesPath.fav_red),
                      )
                          : Image(
                        key: const ValueKey("notRed"),
                        width: getMediaQueryHeight(context, 20),
                        height: getMediaQueryHeight(context, 20),
                        image: const Svg(ImagesPath.fav),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class FavController extends ChangeNotifier {}
