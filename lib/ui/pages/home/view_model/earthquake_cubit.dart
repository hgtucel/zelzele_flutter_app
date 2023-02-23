import 'package:deprem_app/business/i_parser_html.dart';
import 'package:deprem_app/models/earthquake_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EarthquakeState {}

class EarthquakeInitial extends EarthquakeState {}

class EarthquakeLoading extends EarthquakeState {}

class EarthquakeComplete extends EarthquakeState {
  List<EarthquakeModel>? list;
  EarthquakeComplete({this.list});
}

class EarthquakeError extends EarthquakeState {
  String? message;
  EarthquakeError({this.message});
}

class EarthquakeCubit extends Cubit<EarthquakeState> {
  IParserHtml parserHtml;

  EarthquakeCubit(this.parserHtml) : super(EarthquakeInitial());

  Future<List<EarthquakeModel>> earthquakeInfoList() async {
    emit(EarthquakeLoading());

    try {
      final response = await parserHtml.earthquakeInfoList();
      emit(EarthquakeComplete(list: response));
      return [];
    } catch (e) {
      emit(EarthquakeError(message: ""));
      return [];
    }
  }
}
