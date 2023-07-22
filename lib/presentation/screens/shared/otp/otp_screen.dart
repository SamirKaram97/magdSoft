import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/otp_bloc/states.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/otp_request.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp/widgets/OtpFormFiled.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppButton.dart';

import '../../../../business_logic/otp_bloc/events.dart';
import '../../../../constants/constatnts.dart';
import '../../../router/app_router.dart';
import '../../../view/BackGroundGraidentColor.dart';
import '../../../widget/toast.dart';

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
            const BackGroundGraidentColor(),
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
          height: h/designHeight * 62,
        ),
        Text(
          StringsManger.verifyPhone,
          style:Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.white),
        ),
        SizedBox(
          height: h/designHeight * 138,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 4; i++)
              OtpFormFiled(controller: controllers[i], textInputType: TextInputType.number, isLast: i == 3 ? true : false, isFirst: i == 0 ? true : false)
          ],
        ),
        SizedBox(
          height: h/designHeight * 90,
        ),
        InkWell(
            onTap: () {},
            child: Text(
             StringsManger.resendCode,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.primaryBlue),
            )),
        SizedBox(height: h/designHeight * 78,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:  h/designHeight * 44),
          child: AppButton(onPressed: ()async{
            String code= controllers[0].text+controllers[1].text+controllers[2].text+controllers[3].text;
            BlocProvider.of<OtpBloc>(context).add(OtpExecuteEvent(OtpRequest(phone: phone,code: code)));
          },height: h/designHeight * 60, text: StringsManger.verify),
        )
      ],
    );
  }

}



