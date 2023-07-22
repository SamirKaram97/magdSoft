import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../styles/colors.dart';
import '../home_scren.dart';

class CategoryItemListWidget extends StatelessWidget {
  const CategoryItemListWidget({
    Key? key,
    required this.ItemModel,
    required this.index,
  }) : super(key: key);

  final CategoryItemDataModel ItemModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductsBloc>(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h / designHeight * 60,
      width: w / designWidth * 129,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(h / designHeight * 30),
        boxShadow: getBoxShadowApp(h),
        color: cubit.selectedIndex == index
            ? AppColor.primaryBlue
            : AppColor.white,
      ),
      child: InkWell(
        onTap: () {
          cubit.changeSelectedIndex(index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                    image: AssetImage(
                  ItemModel.imagePath,
                )),
                width: w / designWidth * 40,
                height: w / designWidth * 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(h / designHeight * 40),
                  boxShadow: getBoxShadowApp(h),
                  color: AppColor.white,
                )),
            Text(
              ItemModel.title,
              style: GoogleFonts.inter(
                  color: cubit.selectedIndex == index
                      ? AppColor.white
                      : Colors.black,
                  fontSize: w / designWidth * 22),
            )
          ],
        ),
      ),
    );
  }
}