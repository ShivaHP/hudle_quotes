import 'package:flutter/material.dart';
import 'package:hudle_quotes/models/quote/src/quotemodel.dart';
import 'package:hudle_quotes/screens/quotes/src/quote_details.dart';
import 'package:hudle_quotes/screens/quotes/src/quotes_list.dart';
import 'package:hudle_quotes/screens/splashscreen.dart';

class AppRoutes {
  static Route getroutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case QuoteListView.route:
        return PageRouteBuilder(
            pageBuilder: (c, a1, a2) => const QuoteListView(),
            transitionsBuilder: (c, anim, a2, child) =>
                ScaleTransition(scale: anim, child: child),
            transitionDuration: const Duration(milliseconds: 1200));
      case QuoteDetailView.route:
        Map arguments = settings.arguments as Map;
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => QuoteDetailView(
            quote: arguments["data"] ?? QuoteModel(),
          ),
          transitionsBuilder: (c, anim, a2, child) => ScaleTransition(
            scale: anim,
            child: child,
            alignment: Alignment.center,
          ),
          transitionDuration: const Duration(milliseconds: 600),
        );

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
