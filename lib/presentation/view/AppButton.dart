import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppButton extends StatelessWidget {
  final String text;

  final GestureTapCallback? onPressed;

  final double height;

  const AppButton({
    Key? key,

    required this.onPressed, required this.text, required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height:height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),gradient: LinearGradient(colors: [
        AppColor.primaryBlue,
        AppColor.primaryBlue.withOpacity(0.7),
        AppColor.primaryBlue.withOpacity(0.25)
      ]), boxShadow: const []),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: Text(text,style: Theme.of(context).textTheme.bodyMedium,),
            )),
      ),
    );
  }
}