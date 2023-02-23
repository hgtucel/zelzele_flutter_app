import 'package:deprem_app/business/i_parser_html.dart';
import 'package:deprem_app/business/parser_html.dart';
import 'package:deprem_app/ui/pages/home/view/home_page.dart';
import 'package:deprem_app/ui/pages/home/view_model/earthquake_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.

  IParserHtml parserHtml = ParserHtml();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (earthquakeCubitContext) => EarthquakeCubit(parserHtml))
      ]
      ,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeView()
      ),
    );
  }
}