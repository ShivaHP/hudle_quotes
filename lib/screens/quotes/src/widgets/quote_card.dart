import 'package:flutter/material.dart';
import 'package:hudle_quotes/config/palette.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/screens/quotes/src/quote_details.dart';
import 'package:hudle_quotes/utils/customwidgets/custom_text.dart';

class QuoteCard extends StatelessWidget {
  final QuoteModel data;
  const QuoteCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
              Navigator.pushNamed(context, QuoteDetailView.route,arguments: {"data":data});
            },
      child: Column(
        children: [
         
          ListTile(
          
            leading: CircleAvatar(
              radius: 25,
              backgroundImage:const AssetImage("assets/think.png"),
              
              child: const Icon(Icons.person, color: blackcolor),
              backgroundColor: grey100,
            ),
            title: CustomText(
              text: data.author,
              align: TextAlign.left,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10,bottom: 20,left: 10,right: 10),
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(10),
              color: blue
            ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: CustomText(text: data.content,align: TextAlign.left,))
        ],
      ),
    );
  }
}
