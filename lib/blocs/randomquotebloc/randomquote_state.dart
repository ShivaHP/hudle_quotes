import 'package:hudle_quotes/models/quote/src/quotemodel.dart';

abstract class RandomQuoteState{

}
class QuoteInitialState extends RandomQuoteState{}

class QuoteFetchedState extends RandomQuoteState {
  QuoteModel quote;
  QuoteFetchedState(this.quote);
}

class LoadingQuote extends RandomQuoteState{

}

class QuoteFetchingFailed extends RandomQuoteState{
  final String message;
  QuoteFetchingFailed(this.message);
}