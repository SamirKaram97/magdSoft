import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/home_bloc/states.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/otp_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/view/MyFormFiled.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../view/AppCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.accountModel}) : super(key: key);
  final AccountModel accountModel;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<ProductsBloc, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              BackGroundGraidentColor(),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: w/430*10),
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 932 * 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: AppCard(
                          padding: EdgeInsets.symmetric(horizontal  : w/430*15,vertical:w/430*3),
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search,color: Colors.grey,),
                                border: InputBorder.none, hintText: "Search"),
                          ),
                        )),
                        SizedBox(width: w/430*16,),
                        AppCard(padding: EdgeInsets.all(w/430*2),
                        child: IconButton(icon: const Icon(Icons.info_outline),onPressed: (){},),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
