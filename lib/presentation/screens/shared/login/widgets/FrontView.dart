import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';

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

class FrontView extends StatefulWidget {
  FrontView({
    Key? key,
  }) : super(key: key);

  @override
  State<FrontView> createState() => _FrontViewState();
}

class _FrontViewState extends State<FrontView> {
  final List<String> socialImages = [
    ImagesPath.face,
    ImagesPath.ios,
    ImagesPath.google
  ];

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  loginClick(context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(LoginExecuteEvent(LoginRequest(
          name: nameController.text, phone: phoneController.text)));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast(text: state.message, state: ToastState.SUCCESS);
          Navigator.pushNamed(context, RouteNames.otpRoute,
              arguments: phoneController.text);
        } else if (state is LoginErrorState) {
          showToast(text: state.message, state: ToastState.EROOR);
        }
      },
      builder: (context, state) {
        return Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: getMediaQueryWidth(context, 372),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(40.sp),
                    boxShadow: getBoxShadowApp()),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getMediaQueryWidth(context, 25),
                      vertical: getMediaQueryHeight(context, 25)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height:getMediaQueryHeight(context, 27) ,
                        ),
                        Text(
                          StringsManger.welcome,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height:getMediaQueryHeight(context, 15.66) ),
                        Container(
                          color: AppColor.primaryBlue.withOpacity(0.72),
                          height:getMediaQueryHeight(context, 3.13) ,
                          width: getMediaQueryWidth(context, 143),
                        ),
                        SizedBox(
                          height:getMediaQueryHeight(context, 27) ,
                        ),
                        MyFormFiled(
                            textInputType: TextInputType.name,
                            controller: nameController,
                            hint: StringsManger.nameHint),
                        SizedBox(
                          height:getMediaQueryHeight(context, 17) ,
                        ),
                        MyFormFiled(
                          textInputType: TextInputType.phone,
                          controller: phoneController,
                          hint: StringsManger.phoneHint,
                        ),
                        SizedBox(
                          height:getMediaQueryHeight(context, 30) ,
                        ),
                        AppButton(
                            height:getMediaQueryHeight(context, 50) ,
                            text: StringsManger.login,
                            onPressed: () {
                              loginClick(context);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:getMediaQueryHeight(context, 127) ,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: w * 30 / designWidth),
                      child: Container(
                        height: 1,
                        color: AppColor.primaryBlue,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getMediaQueryWidth(context, 10)),
                    child: Text(StringsManger.or,
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.only(end: getMediaQueryWidth(context, 30)),
                      child: Container(
                        height: getMediaQueryHeight(context, 1) ,
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
                  for (int i = 0; i < 3; i++)
                    SocialButton(image: socialImages[i])
                ],
              ),
              SizedBox(
                height:getMediaQueryHeight(context, 100) ,
              )
            ],
          ),
        );
      },
    );
  }
}
