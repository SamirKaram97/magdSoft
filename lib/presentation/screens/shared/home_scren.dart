import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.accountModel}) : super(key: key);
    final AccountModel accountModel;


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(child: Text("home"),),
    );
  }
}
