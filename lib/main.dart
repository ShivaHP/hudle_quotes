import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hudle_quotes/blocs/quotebloc/quote_bloc.dart';
import 'package:hudle_quotes/config/app_routes.dart';
import 'package:hudle_quotes/repository/quoterepo/quoterepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<QuoteRepository>(create: (context)=>QuoteRepository(),child: MyAppView(),);
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuoteBloc>(
      create: (context)=>QuoteBloc(context.read<QuoteRepository>()),
      child: MaterialApp(
        restorationScopeId: "root",
        title: 'Flutter Demo',
        onGenerateRoute:AppRoutes.getroutes,
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,    
        ),
      ),
    );
  }
}
