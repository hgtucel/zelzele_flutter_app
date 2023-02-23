import 'package:deprem_app/business/i_parser_html.dart';
import 'package:deprem_app/business/parser_html.dart';
import 'package:deprem_app/ui/pages/home/view_model/earthquake_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


Future<void> setup() async {

  getIt.registerFactory(() => EarthquakeCubit(parserHtml:getIt()));

  getIt.registerLazySingleton<IParserHtml>(() => ParserHtml());

}