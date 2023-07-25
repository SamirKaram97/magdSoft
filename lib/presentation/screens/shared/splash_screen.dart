import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manger.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value)async {


      String? accountModelString=await CacheHelper.getDataFromSharedPreference(key: "accountModel");
      print(accountModelString);
      if(accountModelString==null) {
        Navigator.pushReplacementNamed(context, RouteNames.loginRoute);
      }
      else
        {
          Navigator.pushReplacementNamed(context, RouteNames.homeRoute,arguments: AccountModel.fromJson(json.decode(accountModelString)));
        }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(color: AppColor.primaryBlue,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.sizeOf(context).width*0.1),
              child: Container(decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(ImagesPath.behindLogo),fit: BoxFit.fill)),),
            ),
            Image.asset(ImagesPath.logo,width: MediaQuery.sizeOf(context).width*0.6),
          ],
        )
      ),
    );
  }
}
