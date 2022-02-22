import 'package:bloc/bloc.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_event.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_state.dart';
import 'package:hudle_quotes/models/quote/src/quote_exception.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/repository/quoterepo/quoterepository.dart';
import 'package:hudle_quotes/utils/helpers/event_helpers.dart';

class QuoteBloc extends Bloc<QuoteEvent,QuoteState>{
  final QuoteRepository _repository;
  QuoteBloc(this._repository):super(QuoteState()){
    on<FetchQuotes>(_fetchquotes);
  }

  _fetchquotes(FetchQuotes event,Emitter<QuoteState> emit)async{
    try {

      if(state.hasreachedmax){
        showtoast("Maximum Content Reached");
      return;
        }
      int pagenumber=state.currentpage+1;
     
      emit(state.copyWith(status: QuoteStatus.loading));
      List<QuoteModel> quoteslist=[...state.quotes];
      List<QuoteModel> quotes=await _repository.getquotes(pagenumber);
      quoteslist.addAll(quotes);
      emit(state.copyWith(status: QuoteStatus.success,quotes: quoteslist,currentpage: pagenumber,hasreachedmax: quotes.isEmpty?true:false));

    } on QuoteException catch (e) {
      showtoast(e.message);
      emit(state.copyWith(status: QuoteStatus.failure));
    }

  }
  
}