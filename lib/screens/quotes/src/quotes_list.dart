import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_bloc.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_event.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_state.dart';
import 'package:hudle_quotes/config/palette.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/screens/quotes/src/widgets/quote_card.dart';
import 'package:hudle_quotes/utils/customwidgets/custom_appbar.dart';

class QuoteListView extends StatefulWidget {
  static const route = "/quotes";
  const QuoteListView({Key? key}) : super(key: key);

  @override
  State<QuoteListView> createState() => _QuoteListViewState();
}

class _QuoteListViewState extends State<QuoteListView> {
  late ScrollController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.hasClients) {
        if (controller.position.pixels == controller.position.maxScrollExtent) {
          context.read<QuoteBloc>().add(FetchQuotes());
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      appBar: const CustomAppBar(text: "Motivational Quotes",leadicon: Icons.menu,iconactive: false,),
      body: Stack(
        children: [
          BlocSelector<QuoteBloc, QuoteState, List<QuoteModel>>(
              selector: (state) => state.quotes,
              builder: (context, quotes) {
                return Scrollbar(
                  child: ListView.builder(
                    controller: controller,
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      return QuoteCard(data: quotes[index]);
                    },
                    itemCount: quotes.length,
                  ),
                );
              }),
          BlocSelector<QuoteBloc, QuoteState, QuoteStatus>(
              selector: (state) => state.status,
              builder: (context, status) {
                return Align(
                    alignment: Alignment.center,
                    child: Visibility(
                       visible: status == QuoteStatus.loading,
                        child: Container(
                        
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: blue650),
                            child: const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ))));
              }),
        ],
      ),
    );
  }
}
