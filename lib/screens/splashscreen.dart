import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_bloc.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_event.dart';
import 'package:hudle_quotes/blocs/randomquotebloc/randomquote_bloc.dart';
import 'package:hudle_quotes/blocs/randomquotebloc/randomquote_event.dart';
import 'package:hudle_quotes/blocs/randomquotebloc/randomquote_state.dart';
import 'package:hudle_quotes/config/palette.dart';
import 'package:hudle_quotes/repository/quoterepo/quoterepository.dart';
import 'package:hudle_quotes/screens/quotes/src/quote_details.dart';
import 'package:hudle_quotes/screens/quotes/src/quotes_list.dart';
import 'package:hudle_quotes/utils/customwidgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  static const String route="/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      context.read<QuoteBloc>().add(FetchQuotes());
      Navigator.pushNamedAndRemoveUntil(context, QuoteListView.route,(_)=>false);
    });

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomQuoteBloc>(
      create: (context)=>RandomQuoteBloc(context.read<QuoteRepository>())..add(FetchRandomQuote()),
      child: Scaffold(
        backgroundColor: whitecolor,
        body: Container(
          alignment: Alignment.center,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/splash.png"),
            const CustomText(text: "Quotes App",fontWeight: FontWeight.bold,fontsize: 20,),
              BlocBuilder<RandomQuoteBloc,RandomQuoteState>(builder: (context,state){
                if(state is QuoteFetchedState ){
                  return Container(
            
                    margin:const EdgeInsets.only(top: 20,left: 20,right: 20),
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      color: blue650,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(text: state.quote.content,color: whitecolor),
                        const SizedBox(height: 5,),
                        CustomText(text: "- "+state.quote.author,align:TextAlign.right,fontsize: 10,fontWeight: FontWeight.bold,color: whitecolor,)
                      ],
                    ),
                  );
                }
                else{
                  return const Text("");
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}