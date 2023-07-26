import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

import 'package:magdsoft_flutter_structure/presentation/screens/shared/login/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/product/proudect_screen.dart';

import '../screens/shared/help/help_screen.dart';
import '../screens/shared/home/home_scren.dart';
import '../screens/shared/layout/layout_screen.dart';
import '../screens/shared/otp/otp_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) =>    LoginScreen());
        case '/otp':
        return MaterialPageRoute(builder: (_) =>    OtpScreen(phone: settings.arguments as String,));
        case '/layout':
        return MaterialPageRoute(builder: (_) =>    LayoutScreen());
        case '/help':
        return MaterialPageRoute(builder: (_) =>    HelpScreen());
        case '/product':
        return MaterialPageRoute(builder: (_) =>    ProductScreen(model: settings.arguments as ProductModel));
      default:
        return null;
    }
  }

}

class RouteNames
{
  static const splashRoute='/';
  static const loginRoute='/login';
  static const otpRoute='/otp';
  static const layoutRoute='/layout';
  static const helpRoute='/help';
  static const productRoute='/product';
}