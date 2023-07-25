import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

import 'package:magdsoft_flutter_structure/presentation/screens/shared/home/widgets/ProductWidget.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/home/widgets/SearchRow.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../../../constants/assets_manger.dart';
import '../../../../constants/constatnts.dart';
import '../../../view/BackGroundGraidentColor.dart';
import '../no_internet_screen.dart';
import 'widgets/CategoryItemListWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.accountModel}) : super(key: key);
  final AccountModel accountModel;
  final List<String> brandsList = [ImagesPath.banner1, ImagesPath.banner2];
  int selectedIndex = 0;
  List<CategoryItemDataModel> categoryList = [
    CategoryItemDataModel(ImagesPath.cup, StringsManger.all),
    CategoryItemDataModel(ImagesPath.acer, StringsManger.acer),
    CategoryItemDataModel(ImagesPath.razer, StringsManger.razer),
  ];


  @override
  Widget build(BuildContext context) {

    

    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is ProductsAddedToFavState) {
          showToast(state: ToastState.SUCCESS, text: StringsManger.itemAdded);
        }
        else if(state is ProductsRemovedFromFavState)
          {
            showToast(state: ToastState.EROOR, text: StringsManger.itemRemoved);
          }
      },
      builder: (context, state) {
        var bloc = BlocProvider.of<ProductsBloc>(context);
        if(state is ProductsErrorState) {
          return const NoInternetScreen();
        }
        return bloc.productsList != null
            ? Scaffold(
                body: Stack(
                  children: [
                    const BackGroundGraidentColor(),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getMediaQueryWidth(context, 20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SearchRow(),
                            SizedBox(
                              height: getMediaQueryHeight(context, 22) ,
                            ),
                            CarouselSlider(
                                items: brandsList
                                    .map((e) => Card(
                                          child: Image.asset(
                                            e,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ))
                                    .toList(),
                                options: CarouselOptions(
                                  height: getMediaQueryHeight(context, 185) ,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                )),
                            SizedBox(
                              height: getMediaQueryHeight(context, 14) ,
                            ),
                            SizedBox(
                                height: getMediaQueryHeight(context, 72) ,
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        CategoryItemListWidget(
                                            ItemModel: categoryList[index],
                                            index: index),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: getMediaQueryWidth(context, 25) ,
                                        ),
                                    itemCount: categoryList.length)),
                            SizedBox(
                              height: getMediaQueryHeight(context, 13) ,
                            ),
                            MasonryGridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: bloc.selectedIndex==1?bloc.acer!.length+1:bloc.selectedIndex==2?bloc.razer!.length+1:bloc.productsList!.length+1,
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              mainAxisSpacing: getMediaQueryHeight(context, 2) ,
                              crossAxisSpacing: getMediaQueryWidth(context, 2),
                              itemBuilder: (context, index) {
                            var list=bloc.selectedIndex==1?bloc.acer!:bloc.selectedIndex==2?bloc.razer!:bloc.productsList!;
                            return index == 0
                              ? Text(
                                  StringsManger.recommended,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )
                              : ProductWidget(index: index-1, productsList: list);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButton: _floatingActionButton(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: _bottomNavigationBar(),
                //other params
              )
            : const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
      },
    );
  }

  AnimatedBottomNavigationBar _bottomNavigationBar() {
    return AnimatedBottomNavigationBar(
                icons:  const[
                  Icons.logout_outlined,
                  Icons.favorite,
                  Icons.notification_add,
                  Icons.settings
                ],
                activeIndex: selectedIndex,
                gapLocation: GapLocation.center,
                notchSmoothness: NotchSmoothness.verySmoothEdge,
                leftCornerRadius: 32,
                rightCornerRadius: 32,
                onTap: (index) {},
                //other params
              );
  }
  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
                  onPressed: () {}, child: const Icon(Icons.home));
  }
}






class CategoryItemDataModel {
  final String imagePath;
  final String title;

  CategoryItemDataModel(this.imagePath, this.title);
}
