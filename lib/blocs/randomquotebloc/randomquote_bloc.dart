import 'package:bloc/bloc.dart';
import 'package:hudle_quotes/blocs/randomquotebloc/randomquote_event.dart';
import 'package:hudle_quotes/blocs/randomquotebloc/randomquote_state.dart';
import 'package:hudle_quotes/models/quote/src/quote_exception.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/repository/quoterepo/quoterepository.dart';
import 'package:hudle_quotes/utils/webservice/webservice.dart';

class RandomQuoteBloc extends Bloc<RandomQuoteEvent,RandomQuoteState>{
  final QuoteRepository _repository;
  RandomQuoteBloc(this._repository):super(QuoteInitialState()){
    on<FetchRandomQuote>(_fetchrandomquote);
  }


  _fetchrandomquote(FetchRandomQuote event,Emitter<RandomQuoteState> emit)async{
    try {
      emit(LoadingQuote());
      QuoteModel response=await _repository.getrandomquote();
      emit(QuoteFetchedState(response));
    } on QuoteException catch (e) {
      emit(QuoteFetchingFailed(e.message));
    }
  }
}