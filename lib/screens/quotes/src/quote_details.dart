import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hudle_quotes/config/palette.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/utils/customwidgets/custom_appbar.dart';
import 'package:hudle_quotes/utils/customwidgets/custom_text.dart';
import 'package:hudle_quotes/utils/extensions/widget_extension.dart';
import 'package:share_plus/share_plus.dart';

class QuoteDetailView extends StatelessWidget {
  static const String route="/quotedetail";
  final QuoteModel quote;
  const QuoteDetailView({Key? key,required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: CustomAppBar(text: "Quote by ${quote.author}"),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
          Image.asset("assets/ideas.png"),
            SelectableText(quote.content,style:const TextStyle(color:blackcolor,fontWeight: FontWeight.w600),cursorColor: blackcolor,textAlign: TextAlign.left,),
           Container(
             margin: EdgeInsets.only(top: 20),
             padding: const EdgeInsets.symmetric(vertical: 5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: blue650
             ),
             child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                     backgroundImage:const AssetImage("assets/think.png"),
                child: const Icon(Icons.person, color: blackcolor),
                backgroundColor: grey100,
              ),
              
              trailing: IconButton(icon: Icon(Icons.share,color: whitecolor,),onPressed: (){
                Share.share("${quote.content}\n~${quote.author}");
              },),
              title: CustomText(
                align:TextAlign.left,
                text:"Quote by ~ "+ quote.author,
                fontWeight: FontWeight.bold,
                color: whitecolor,
              ),
          ),
           ),
          ],
        ),
      ) ,
    );
  }
}