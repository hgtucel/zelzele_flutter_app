import 'package:deprem_app/models/earthquake_model.dart';

abstract class IParserHtml {
  Future<List<EarthquakeModel>> earthquakeInfoList();
}