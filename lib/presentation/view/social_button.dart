import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../constants/assets_manger.dart';

class SocialButton extends StatelessWidget {
  final String image;
  const SocialButton({
    Key? key, required this.image
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final double w=MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.all(w/430*14.0),
      child: Container(height: w/430*52,width: w/430*52,decoration: BoxDecoration(color:AppColor.white,shape: BoxShape.circle,boxShadow: [BoxShadow(color: AppColor.shadowColor.withOpacity(.25),blurRadius: 20,spreadRadius: 5,offset: Offset(2, 5))],), child: Padding(
        padding:  EdgeInsets.all(w*8.0/430),
        child: Image.asset(image,fit: BoxFit.fitHeight),
      )
      ),
    );
  }
}
