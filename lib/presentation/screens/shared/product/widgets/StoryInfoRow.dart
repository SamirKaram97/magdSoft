import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../business_logic/home_bloc/bloc.dart';
import '../../../../../constants/assets_manger.dart';
import '../../../../../constants/constatnts.dart';
import '../../../../../data/models/product_model.dart';
import '../../../../styles/colors.dart';
import '../../../../view/AppContainer.dart';
import '../proudect_screen.dart';
class StoryInfoRow extends StatelessWidget {
  const StoryInfoRow({
    Key? key, required this.model,
  }) : super(key: key);

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return AppContainer(
        radius: h / designHeight * 10,
        xOffset: 0,
        yOffset: h / designHeight * 2,
        blurRadius: h / designHeight * 4,
        spreadRadius: h / designHeight * 5,
        child: Padding(
          padding: EdgeInsets.all(h / designHeight * 5),
          child: Row(
            children: [
              AppContainer(
                  height: h / designHeight * 55,
                  width: w / designWidth * 55,
                  radius: h / designHeight * 10,
                  xOffset: 0,
                  yOffset: 0,
                  blurRadius: h / designHeight * 4,
                  spreadRadius: h / designHeight * 2,
                  child: Image.asset(ImagesPath.acerll)),
              SizedBox(
                width: w / designWidth * 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.company ?? "" + "Offical Store",
                    style: GoogleFonts.inter(fontSize: w / designWidth * 17),
                  ),
                  Text(
                    "View Store",
                    style: GoogleFonts.inter(
                        fontSize: w / designWidth * 12, color: AppColor.grey),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: AppContainer(
                  spreadRadius: h / designHeight * 1,
                  radius: h / designHeight * 5,
                  blurRadius: h / designHeight * 4,
                  xOffset: h / designHeight * 0,
                  yOffset: h / designHeight * 2,
                  height: h / designHeight * 30,
                  width: h / designHeight * 30,
                  child: const Icon(Icons.keyboard_arrow_left_outlined),
                ),
              ),
            ],
          ),
        ));
  }
}