abstract class QuoteEvent{
}

class FetchQuotes extends QuoteEvent{
}

class FetchQuoteById extends QuoteEvent{
  final String quoteid;
  FetchQuoteById(this.quoteid);
}

