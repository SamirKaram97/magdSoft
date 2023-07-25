import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:magdsoft_flutter_structure/business_logic/help_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/help_bloc/states.dart';
import 'package:magdsoft_flutter_structure/constants/string_manger.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/HelpModel.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
import 'package:magdsoft_flutter_structure/presentation/responsive.dart';
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
              padding:  EdgeInsets.only(left:getMediaQueryWidth(context, 16) ,right: getMediaQueryWidth(context, 16) ,top: getMediaQueryWidth(context, 50) ,bottom: getMediaQueryWidth(context, 20) ),
              child: Column(
                children: [
                  Text(StringsManger.help,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.white),),
                  Expanded(child: ListView.separated(itemBuilder: (context, index) =>AppCard(padding: EdgeInsets.all(
                      getMediaQueryWidth(context, 13) ),child: CardColumn(helpModelList: bloc.helpList!, index: index)) , separatorBuilder: (context, index) => SizedBox(height:getMediaQueryHeight(context, 27),), itemCount:bloc.helpList!.length)),
                  AppButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RouteNames.homeRoute,arguments: widget.accountModel);
                  }, text: StringsManger.continueW, height:getMediaQueryHeight(context, 50) )

                ],
              ),
            )
          ],
        ),
      );}
        else if(state is HelpLoadingState) {
          return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
        } else {
          return const Scaffold(body: Center(child: Text(StringsManger.wentWrong),),);
        }
      },

    );
  }
}



