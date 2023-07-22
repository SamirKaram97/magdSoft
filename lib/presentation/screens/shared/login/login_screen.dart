import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/events.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login/widgets/FrontView.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login/widgets/MiddleShape.dart';

import '../../../../business_logic/login_bloc/bloc.dart';
import '../../../../business_logic/login_bloc/states.dart';
import '../../../../constants/assets_manger.dart';
import '../../../../constants/constatnts.dart';
import '../../../../data/network/requests/login_request.dart';
import '../../../../di.dart';
import '../../../view/BackGraidentImage.dart';
import '../../../view/MyFormFiled.dart';
import '../../../view/social_button.dart';
import '../../../widget/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final List<String> socialImages = [
    ImagesPath.face,
    ImagesPath.ios,
    ImagesPath.google
  ];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var scafoldKey = GlobalKey<ScaffoldState>();

  loginClick(context)
  {
    if(formKey.currentState!.validate())
    {

      print("true");
      BlocProvider.of<LoginBloc>(context).add(
          LoginExecuteEvent(LoginRequest(
              name: nameController.text,
              phone: phoneController.text)));}
    else{print("false");}
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state is LoginSuccessState)
          {
            showToast(text: state.message,state: ToastState.SUCCESS);

             Navigator.pushNamed(context, RouteNames.otpRoute,arguments: phoneController.text);
          }
        else if(state is LoginErrorState)
          {
            showToast(text:state.message,state: ToastState.EROOR);
          }

      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const BackGraidentImage(),
              const MiddleShape(),
              FrontView(formKey: formKey, nameController: nameController, phoneController: phoneController, socialImages: socialImages, onPressed: (){
                loginClick(context);
              })
            ],
          ),
        );
      },
    );
  }

}






