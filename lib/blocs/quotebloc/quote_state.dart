import 'package:hudle_quotes/models/quote/src/quotemodel.dart';

enum QuoteStatus { loading, success, failure,maxreached}

class QuoteState {
  final QuoteStatus status;
  final List<QuoteModel> quotes;
   int currentpage;
  final bool hasreachedmax;
  QuoteState(
      {this.status = QuoteStatus.success,
      this.quotes = const [],
      this.currentpage = 0,
      this.hasreachedmax = false});

  QuoteState copyWith(
      {QuoteStatus? status,
      List<QuoteModel>? quotes,
      int? currentpage,
      bool? hasreachedmax}) {
    return QuoteState(
        status: status ?? this.status,
        quotes: quotes ?? this.quotes,
        currentpage: currentpage ?? this.currentpage,
        hasreachedmax: hasreachedmax ?? this.hasreachedmax);
  }
}
