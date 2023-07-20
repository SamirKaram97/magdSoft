import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/view/MyFormFiled.dart';

import '../../../constants/assets_manger.dart';
import '../../view/AppCard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.accountModel}) : super(key: key);
  final AccountModel accountModel;
  final List<String> brandsList = [ImagesPath.banner1, ImagesPath.banner2];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              BackGroundGraidentColor(),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w / 430 * 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: h / 932 * 50,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: AppCard(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w / 430 * 15,
                                  vertical: w / 430 * 3),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Search"),
                              ),
                            )),
                            SizedBox(
                              width: w / 430 * 16,
                            ),
                            AppCard(
                              padding: EdgeInsets.all(w / 430 * 2),
                              child: IconButton(
                                icon: const Icon(Icons.info_outline),
                                onPressed: () {},
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h / 932 * 22,
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
                        height: h / 932 * 185,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 5),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ],
              )
            ],
          ),
            floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.home)),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        );
      },
    );
  }
}
