import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login_screen.dart';

import '../screens/shared/help_screen.dart';
import '../screens/shared/home_scren.dart';
import '../screens/shared/otp_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
        case '/otp':
        return MaterialPageRoute(builder: (_) =>   OtpScreen(phone: settings.arguments as String,));
        case '/home':
        return MaterialPageRoute(builder: (_) =>   HomeScreen(accountModel: settings.arguments as AccountModel));
        case '/help':
        return MaterialPageRoute(builder: (_) =>    HelpScreen(accountModel: settings.arguments as AccountModel));
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
  static const homeRoute='/home';
  static const helpRoute='/help';
}