import 'package:flutter/cupertino.dart';
import 'package:magdsoft_flutter_structure/constants/constatnts.dart';

double getMediaQueryHeight(context,double height)
{
  return (MediaQuery.of(context).size.height)/designHeight*height;
}


double getMediaQueryWidth(context,double width)
{
  return (MediaQuery.of(context).size.width)/designWidth*width;
}