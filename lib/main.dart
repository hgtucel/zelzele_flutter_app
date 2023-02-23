import 'package:deprem_app/business/i_parser_html.dart';
import 'package:deprem_app/business/parser_html.dart';
import 'package:deprem_app/core/di.dart';
import 'package:deprem_app/ui/pages/home/view/home_page.dart';
import 'package:deprem_app/ui/pages/home/view_model/earthquake_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di.dart' as di;

Future<void> main() async {
  await di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (earthquakeCubitContext) => getIt<EarthquakeCubit>())
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