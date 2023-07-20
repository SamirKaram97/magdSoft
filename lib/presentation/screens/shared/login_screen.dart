import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_bloc/events.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppButton.dart';

import '../../../business_logic/login_bloc/bloc.dart';
import '../../../business_logic/login_bloc/states.dart';
import '../../../constants/assets_manger.dart';
import '../../../data/network/requests/login_request.dart';
import '../../../di.dart';
import '../../view/BackGraidentImage.dart';
import '../../view/MyFormFiled.dart';
import '../../view/social_button.dart';
import '../../widget/toast.dart';

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
              _middleShape(h),
              _frontView(w, h, context,(){
                loginClick(context);
              })
            ],
          ),
        );
      },
    );
  }

  Align _frontView(double w, double h, context,GestureTapCallback? onPressed) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: w / 430 * 372,
            height: h / 932 * 345,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(w / 430 * 40),
                boxShadow: [
                  BoxShadow(
                      color: AppColor.shadowColor.withOpacity(0.25),
                      offset: const Offset(2, 5),
                      spreadRadius: 5,
                      blurRadius: 20)
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w / 430 * 25),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 932 * 27,
                    ),
                    Text(
                      "Welcome",
                      style: GoogleFonts.inter(
                          fontSize: h / 932 * 30, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: h / 932 * 15.66),
                    Container(
                      color: AppColor.primaryBlue.withOpacity(0.72),
                      height: h / 932 * 3.13,
                      width: w / 430 * 143,
                    ),
                    Spacer(),
                    MyFormFiled(
                        textInputType: TextInputType.name,
                        controller: nameController,
                        hint: "Enter your Name"),
                    SizedBox(
                      height: h / 932 * 17,
                    ),
                    MyFormFiled(
                      textInputType: TextInputType.phone,
                      controller: phoneController,
                      hint: 'Enter your phone',
                    ),
                    SizedBox(
                      height: h / 932 * 30,
                    ),
                    AppButton(
                        height: h / 932 * 50,
                        text: "Login",
                        onPressed: onPressed),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: h / 932 * 127,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: w * 30 / 430),
                  child: Container(
                    height: 1,
                    color: AppColor.primaryBlue,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 10 / 430),
                child: Text("OR",
                    style: GoogleFonts.inter(color: AppColor.primaryBlue)),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: w * 30 / 430),
                  child: Container(
                    height: h / 617 * 1,
                    color: AppColor.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 617 * 66,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++) SocialButton(image: socialImages[i])
            ],
          ),
          SizedBox(
            height: h / 932 * 100,
          )
        ],
      ),
    );
  }

  Align _middleShape(double h) {
    return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Container(
          width: double.infinity,
          height: h * .6,
          decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(60), topEnd: Radius.circular(60))),
        ));
  }

}


