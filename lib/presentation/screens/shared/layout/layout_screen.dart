import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/layout/favourite_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/layout/notifications_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/layout/settings_screen.dart';


import '../../../../business_logic/layout_cubit/layout_cubit.dart';
import '../../../../business_logic/layout_cubit/layout_state.dart';
import '../../../../constants/string_manger.dart';
import '../../../router/app_router.dart';
import '../../../styles/colors.dart';
import '../../../view/BackGroundGraidentColor.dart';
import '../../../widget/toast.dart';
import '../home/home_scren.dart';

class LayoutScreen extends StatelessWidget {
   LayoutScreen({super.key});

  List<Widget> pages=[HomeScreen(),const FavouritesScreen(),const NotificationsScreen(),const SettingsScreen(),HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<LayoutCubit,LayoutState>(
      listener: (context, state) {
        if (state is LayoutAddedProductToFavState) {
          showToast(state: ToastState.SUCCESS, text: StringsManger.itemAdded);
        }
        else if(state is LayoutRemovedProductFromFavState)
        {
          showToast(state: ToastState.EROOR, text: StringsManger.itemRemoved);
        }

      },
      builder: (context, state) =>Scaffold(
        body: Stack(
          children: [
            const BackGroundGraidentColor(),
            pages[LayoutCubit.get(context).selectedBottomIndex],
          ],
        ),
        floatingActionButton: _floatingActionButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomNavigationBar(context),

      ),

    );
  }
}

void _logOut(context)async
{
  await CacheHelper.clearData();
  Navigator.pushReplacementNamed(context, RouteNames.loginRoute);
}
AnimatedBottomNavigationBar _bottomNavigationBar(context) {
  return AnimatedBottomNavigationBar(
    icons:  const[
      Icons.logout_outlined,
      Icons.favorite,
      Icons.notification_add,
      Icons.settings
    ],
    activeIndex: LayoutCubit.get(context).selectedBottomIndex,
    gapLocation: GapLocation.center,
    activeColor: Colors.black,
    inactiveColor: AppColor.grey,
    notchSmoothness: NotchSmoothness.verySmoothEdge,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    onTap: (index) {
     LayoutCubit.get(context).changeSelectedBottomIndex(index);
     if(index==0)
       {
         _logOut(context);
       }
    },
    //other params
  );
}

FloatingActionButton _floatingActionButton(context) {
  return FloatingActionButton(
      onPressed: () {
        LayoutCubit.get(context).changeSelectedBottomIndex(4);
      }, child: const Icon(Icons.home));
}