import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/states.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login/widgets/FrontView.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login/widgets/MiddleShape.dart';
import '../../../view/BackGraidentImage.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const BackGraidentImage(),
          SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                const MiddleShape(),
                FrontView()
              ],
            ),
          )

        ],
      ),
    );
  }

}






