import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../responsive.dart';
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
    return Center(
      child: Container(
        height: getMediaQueryHeight(context,52),
        width: getMediaQueryWidth(context,129),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.sp),
          boxShadow: getBoxShadowApp(),
          color: cubit.selectedCategoryIndex == index
              ? AppColor.primaryBlue
              : AppColor.white,
        ),
        child: InkWell(
          onTap: () {
            cubit.changeSelectedCategoryIndex(index);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: getMediaQueryWidth(context,40) ,
                  height: getMediaQueryHeight(context,40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(getMediaQueryHeight(context,40) ),
                    boxShadow: getBoxShadowApp(),
                    color: AppColor.white,
                  ),
                  child: Image(
                      image: AssetImage(
                    ItemModel.imagePath,
                  ))),
              Text(
                ItemModel.title,
                style: cubit.selectedCategoryIndex == index
                    ?  Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 22.sp)
                    :Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 22.sp,color: AppColor.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}