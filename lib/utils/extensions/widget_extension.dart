import 'package:flutter/material.dart';

extension SpacingExtension on Widget{
  Widget pad({double top=0,double bottom=0,double left=0,double right=0}){
    return Padding(padding:  EdgeInsets.fromLTRB(left, top, right, bottom),child: this,);
  }

}