import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../constants/constatnts.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppButton.dart';
import '../../../../view/MyFormFiled.dart';
import '../../../../view/social_button.dart';

class FrontView extends StatelessWidget {
  const FrontView({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.socialImages,
    required this.onPressed,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final List<String> socialImages;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                      "Welcome",
                      style: GoogleFonts.inter(
                          fontSize: h/designHeight * 30, fontWeight: FontWeight.w400),
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
                        hint: "Enter your Name"),
                    SizedBox(
                      height: h/designHeight * 17,
                    ),
                    MyFormFiled(
                      textInputType: TextInputType.phone,
                      controller: phoneController,
                      hint: 'Enter your phone',
                    ),
                    SizedBox(
                      height: h/designHeight * 30,
                    ),
                    AppButton(
                        height: h/designHeight * 50,
                        text: "Login",
                        onPressed: onPressed),
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
                child: Text("OR",
                    style: GoogleFonts.inter(color: AppColor.primaryBlue)),
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
  }
}