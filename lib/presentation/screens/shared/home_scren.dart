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
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/MyFormFiled.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../../../constants/assets_manger.dart';
import '../../../constants/constatnts.dart';
import '../../view/AppCard.dart';

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
        if(state is ProductsAddtoFavState)
          {
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
                          _searchRow(w, h),
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
                            itemCount: bloc.productsList!.length,
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            mainAxisSpacing: h / designHeight * 2,
                            crossAxisSpacing: w / designWidth * 2,
                            itemBuilder: (context, index) => index == 0
                                ? Text(
                                    "Recommended for You",
                                    style: GoogleFonts.inter(
                                        fontSize: w / designWidth * 30),
                                  )
                                : _productWidget(
                                    w, h, index, bloc.productsList!,context),
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

  Widget _productWidget(
      double w, double h, int index, List<ProductModel> productsList,context) {
    return Padding(
      padding: EdgeInsets.all(w / designWidth * 10),
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
                            onTap: ()async {
                              await BlocProvider.of<ProductsBloc>(context).addToFav(productsList[index].id!);

                            },
                            child: Padding(
                              padding: EdgeInsets.all(h / designHeight * 10),
                              child: Image(
                                width: h / designHeight * 20,
                                height: h / designHeight * 20,
                                image:  Svg(BlocProvider.of<ProductsBloc>(context).favList.contains(productsList[index].id!)?ImagesPath.fav_red:ImagesPath.fav),
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ])),
    );
  }

  Widget _searchRow(double w, double h) {
    return Column(
      children: [
        SizedBox(
          height: h / designHeight * 50,
        ),
        Row(
          children: [
            Expanded(
                child: AppCard(
              padding: EdgeInsets.symmetric(
                  horizontal: w / designWidth * 15,
                  vertical: w / designWidth * 3),
              child: TextFormField(
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: "Search"),
              ),
            )),
            SizedBox(
              width: w / designWidth * 16,
            ),
            AppCard(
              padding: EdgeInsets.all(w / designWidth * 2),
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              ),
            )
          ],
        )
      ],
    );
  }
}

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

class CategoryItemDataModel {
  final String imagePath;
  final String title;

  CategoryItemDataModel(this.imagePath, this.title);
}
