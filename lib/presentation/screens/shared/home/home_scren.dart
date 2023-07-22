import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/home/widgets/ProductWidget.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/home/widgets/SearchRow.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/MyFormFiled.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../../../constants/assets_manger.dart';
import '../../../../constants/constatnts.dart';
import '../../../view/AppCard.dart';
import '../../../view/BackGroundGraidentColor.dart';
import 'widgets/CategoryItemListWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.accountModel}) : super(key: key);
  final AccountModel accountModel;
  final List<String> brandsList = [ImagesPath.banner1, ImagesPath.banner2];
  int selectedIndex = 0;
  List<CategoryItemDataModel> categoryList = [
    CategoryItemDataModel(ImagesPath.cup, "All"),
    CategoryItemDataModel(ImagesPath.acer, "Acer"),
    CategoryItemDataModel(ImagesPath.razer, "Razer"),
  ];


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {
        if (state is ProductsAddtoFavState) {
          showToast(state: ToastState.SUCCESS, text: "Item added successfully");
        }
      },
      builder: (context, state) {
        var bloc = BlocProvider.of<ProductsBloc>(context);
        return bloc.productsList != null
            ? Scaffold(
                body: Stack(
                  children: [
                    const BackGroundGraidentColor(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w / designWidth * 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SearchRow(),
                          SizedBox(
                            height: h / designHeight * 22,
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
                                height: h / designHeight * 185,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              )),
                          SizedBox(
                            height: h / designHeight * 14,
                          ),
                          SizedBox(
                              height: h / designHeight * 60,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      CategoryItemListWidget(
                                          ItemModel: categoryList[index],
                                          index: index),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: w / designWidth * 25,
                                      ),
                                  itemCount: categoryList.length)),
                          SizedBox(
                            height: h / designHeight * 13,
                          ),
                          Expanded(
                              child: MasonryGridView.count(
                            itemCount: bloc.selectedIndex==1?bloc.acer!.length+1:bloc.selectedIndex==2?bloc.razer!.length+1:bloc.productsList!.length+1,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: h / designHeight * 2,
                            crossAxisSpacing: w / designWidth * 2,
                            itemBuilder: (context, index) {
                              var list=bloc.selectedIndex==1?bloc.acer!:bloc.selectedIndex==2?bloc.razer!:bloc.productsList!;
                              print(list.length);
                              return index == 0
                                ? Text(
                                    "Recommended for You",
                                    style: GoogleFonts.inter(
                                        fontSize: w / designWidth * 30),
                                  )
                                : ProductWidget(index: index-1, productsList: list);
                            },
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                    onPressed: () {}, child: Icon(Icons.home)),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: AnimatedBottomNavigationBar(
                  icons: const [
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
                ),
                //other params
              )
            : const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
      },
    );
  }
}






class CategoryItemDataModel {
  final String imagePath;
  final String title;

  CategoryItemDataModel(this.imagePath, this.title);
}
