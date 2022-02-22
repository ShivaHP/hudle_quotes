import 'package:bloc/bloc.dart';
import 'package:hudle_quotes/blocs/quotedetailbloc/quotedetail_event.dart';
import 'package:hudle_quotes/blocs/quotedetailbloc/quotedetail_state.dart';

class QuoteDetailBloc extends Bloc<QuoteDetailEvent,QuoteDetailState>{
 
  QuoteDetailBloc():super(QuoteDetailState());
}