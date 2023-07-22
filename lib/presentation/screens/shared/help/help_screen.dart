import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/states.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/HelpModel.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help/widgets/card_colun.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/AppButton.dart';

import '../../../../constants/constatnts.dart';
import '../../../../data/models/account_model.dart';
import '../../../view/AppCard.dart';
import '../../../view/BackGroundGraidentColor.dart';

class HelpScreen extends StatefulWidget {
  HelpScreen({Key? key, required this.accountModel}) : super(key: key);
  final AccountModel accountModel;

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

@override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  BlocConsumer<HelpBloc,HelpState>(
      listener: (context, state) {},
      builder: (context, state) {
        var bloc=BlocProvider.of<HelpBloc>(context);
        if(bloc.helpList!=null)
        {return Scaffold(
        body: Stack(
          children: [
            const BackGroundGraidentColor(),
            Padding(
              padding:  EdgeInsets.only(left:w / designWidth * 16,right: w / designWidth * 16,top: w / designWidth * 50,bottom: w / designWidth * 20),
              child: Column(
                children: [
                  Text("Help",style: GoogleFonts.inter(color: AppColor.white,fontWeight: FontWeight.w400,fontSize: w / designWidth * 30),),
                  Expanded(child: ListView.separated(itemBuilder: (context, index) =>AppCard(padding: EdgeInsets.all(w/designWidth*13),child: CardColumn(helpModelList: bloc.helpList!, index: index)) , separatorBuilder: (context, index) => SizedBox(height: h/932*27,), itemCount:bloc.helpList!.length)),
                  AppButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RouteNames.homeRoute,arguments: widget.accountModel);
                  }, text: "Continue", height: w / designWidth * 50)

                ],
              ),
            )
          ],
        ),
      );}
        else if(state is HelpLoadingState) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
        } else
          return Scaffold(body: Center(child: Text("something went wrong"),),);
      },

    );
  }
}



