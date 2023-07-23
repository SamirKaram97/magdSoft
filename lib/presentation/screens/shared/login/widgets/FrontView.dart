import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';

import '../../../../../business_logic/login_bloc/bloc.dart';
import '../../../../../business_logic/login_bloc/events.dart';
import '../../../../../business_logic/login_bloc/states.dart';
import '../../../../../constants/assets_manger.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/network/requests/login_request.dart';
import '../../../../router/app_router.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppButton.dart';
import '../../../../view/MyFormFiled.dart';
import '../../../../view/social_button.dart';
import '../../../../widget/toast.dart';

class FrontView extends StatelessWidget {
   FrontView({
    Key? key,

  }) : super(key: key);
  final List<String> socialImages = [
    ImagesPath.face,
    ImagesPath.ios,
    ImagesPath.google
  ];
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
   var formKey = GlobalKey<FormState>();

  loginClick(context)
  {
    if(formKey.currentState!.validate())
    {
      BlocProvider.of<LoginBloc>(context).add(
          LoginExecuteEvent(LoginRequest(
              name: nameController.text,
              phone: phoneController.text)));}
    else{}
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
        return Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: w / designWidth * 372,
                height: h/designHeight * 345,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(w / designWidth * 40),
                    boxShadow: getBoxShadowApp(h)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w / designWidth * 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: h/designHeight * 27,
                        ),
                        Text(
                          StringsManger.welcome,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: h/designHeight * 15.66),
                        Container(
                          color: AppColor.primaryBlue.withOpacity(0.72),
                          height: h/designHeight * 3.13,
                          width: w / designWidth * 143,
                        ),
                        const Spacer(),
                        MyFormFiled(
                            textInputType: TextInputType.name,
                            controller: nameController,
                            hint: StringsManger.nameHint),
                        SizedBox(
                          height: h/designHeight * 17,
                        ),
                        MyFormFiled(
                          textInputType: TextInputType.phone,
                          controller: phoneController,
                          hint: StringsManger.phoneHint,
                        ),
                        SizedBox(
                          height: h/designHeight * 30,
                        ),
                        AppButton(
                            height: h/designHeight * 50,
                            text: StringsManger.login,
                            onPressed: (){
                              loginClick(context);
                            }),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h/designHeight * 127,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: w * 30 / designWidth),
                      child: Container(
                        height: 1,
                        color: AppColor.primaryBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 10 / designWidth),
                    child: Text(StringsManger.or,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: w * 30 / designWidth),
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
                height: h/designHeight * 100,
              )
            ],
          ),
        );
      },
    );
  }
}