import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("No Internet connection please check your Network and try again",style: TextStyle(color: Colors.red),),
          SizedBox(height: getMediaQueryHeight(context, 20),),
          GestureDetector(
            onTap: () {},
            child: const Text("Try Again",style: TextStyle(color: Colors.red),),
          )
        ],
      ),
    );
  }
}
