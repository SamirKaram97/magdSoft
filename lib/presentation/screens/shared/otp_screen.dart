import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/states.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/otp_request.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppButton.dart';

import '../../../business_logic/otp_bloc/events.dart';
import '../../router/app_router.dart';
import '../../widget/toast.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  List<TextEditingController> controllers = [
    for (int i = 0; i < 4; i++) TextEditingController()
  ];

  _OtpScreenState();

  @override
  Widget build(BuildContext context) {
    print(widget.phone);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;


    return BlocConsumer<OtpBloc,OtpState>(
      listener: (context, state) {
        if(state is OtpSuccessState)
        {
          showToast(text: "welcome ${state.accountModel.name}",state: ToastState.SUCCESS);
          Navigator.pushNamed(context, RouteNames.helpRoute,arguments: state.accountModel);
        }
        else if(state is OtpErrorState)
        {
          showToast(text: state.message,state: ToastState.EROOR);
        }
      },
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            BackGroundGraidentColor(),
            _columnElements(h, w, context,widget.phone),
          ],
        ),
      ),
    );
  }


  Column _columnElements(h, w, context,String phone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: h / 932 * 62,
        ),
        Text(
          "Verify Phone",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: h / 932 * 30,
              color: AppColor.white),
        ),
        SizedBox(
          height: h / 932 * 138,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              _otpFormFiled(controllers[i], h, w, context,
                  isFirst: i == 0 ? true : false, isLast: i == 3 ? true : false)
          ],
        ),
        SizedBox(
          height: h / 932 * 90,
        ),
        InkWell(
            onTap: () {},
            child: Text(
              "Resend code",
              style: GoogleFonts.inter(
                  color: AppColor.primaryBlue,
                  fontSize: h / 932 * 20,
                  fontWeight: FontWeight.w400),
            )),
        SizedBox(height: h / 932 * 78,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:  h / 932 * 44),
          child: AppButton(onPressed: ()async{
            String code= controllers[0].text+controllers[1].text+controllers[2].text+controllers[3].text;
            BlocProvider.of<OtpBloc>(context).add(OtpExecuteEvent(OtpRequest(phone: phone,code: code)));
          },height: h / 932 * 60, text: "Verify"),
        )
      ],
    );
  }

  Widget _otpFormFiled(TextEditingController controller, h, w, context,
      {TextInputType? textInputType, bool? isLast, bool? isFirst}) {
    return Padding(
      padding: EdgeInsets.all(w / 430 * 9.5),
      child: Container(
        width: w / 430 * 70,
        height: w / 430 * 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(w / 430 * 15),
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                  color: AppColor.shadowColor.withOpacity(0.25),
                  offset: Offset(w / 430 * 2, w / 430 * 2),
                  blurRadius: w / 430 * 8,
                  spreadRadius: w / 430 * 2)
            ]),
        child: Center(
          child: TextFormField(
              controller: controller,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "please enter a value for this box";
                }
                return null;
              },
              textAlign: TextAlign.center,
              keyboardType: textInputType,
              onChanged: (value) {
                if (value.isNotEmpty && isLast != true) {
                  FocusScope.of(context).nextFocus();
                } else if ((value.isEmpty && isFirst != true)) {
                  FocusScope.of(context).previousFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsetsDirectional.all(w / 430 * 9.5))),
        ),
      ),
    );
  }
}

class BackGroundGraidentColor extends StatelessWidget {
  const BackGroundGraidentColor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                AppColor.primaryBlue.withOpacity(0.85),
                AppColor.primaryBlue.withOpacity(0)
              ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter)),
        )),
        Expanded(child: Container())
      ],
    );
  }
}
