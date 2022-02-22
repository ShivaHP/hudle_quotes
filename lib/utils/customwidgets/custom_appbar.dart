import 'package:flutter/material.dart';
import 'package:hudle_quotes/config/palette.dart';
import 'package:hudle_quotes/utils/customwidgets/custom_text.dart';

class CustomAppBar extends StatelessWidget  with PreferredSizeWidget{
  final String text;
  final bool centertitle;
  final IconData? leadicon;
  final bool iconactive;
  const CustomAppBar({Key? key,required this.text,this.centertitle=false,this.iconactive=true,this.leadicon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whitecolor,
      elevation: 1,
      leading: IconButton(
        icon: Icon(leadicon??Icons.arrow_back_ios_new,color: blackcolor),
        onPressed:iconactive? (){
          Navigator.pop(context);
        }:null,

      ),
      centerTitle: centertitle,
      title:CustomText(text:text,fontsize: 17,fontWeight: FontWeight.bold,),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);
}