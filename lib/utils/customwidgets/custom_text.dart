import 'package:flutter/material.dart';
import 'package:hudle_quotes/config/palette.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign align;
  const CustomText({Key? key,required this.text,this.fontsize=14,this.color=blackcolor,this.fontWeight=FontWeight.normal,this.align=TextAlign.center}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: fontsize,fontWeight: fontWeight,color: color),textAlign: align,);
  }
}