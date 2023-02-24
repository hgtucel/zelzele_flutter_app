import 'dart:convert';

import 'package:deprem_app/business/i_parser_html.dart';
import 'package:deprem_app/models/earthquake_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

class ParserHtml implements IParserHtml {
  @override
  Future<List<EarthquakeModel>> earthquakeInfoList() async {
    final endpoint = Uri.https(
      "deprem.afad.gov.tr",
      "last-earthquakes.html",
    );
    final response = await http.get(endpoint, headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": 'true',
      "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
      "Content-Type": "text/html; charset=ISO-8859-9",
    });

    Document document = parser.parse(utf8.decode(response.bodyBytes));
    List<Element> tds = document.querySelectorAll(".content-table tbody tr");
    List<Map<String, dynamic>> linkMap = [];
    //print(tds.first.children.first.innerHtml);
    for (var item in tds) {
      linkMap.add({
        "depth": item.children[3].innerHtml,
        "city": item.children[6].innerHtml
            .replaceFirst("(", "")
            .replaceAll(")", "")
            .split(" ")
            .last,
        "size": num.tryParse(item.children[5].innerHtml),
        "district": item.children[6].innerHtml
            .replaceFirst("(", "")
            .replaceAll(")", "")
            .split(" ")
            .first,
        "time": item.children.first.innerHtml
      });
    }
    return linkMap.map((item) => EarthquakeModel.fromJson(item)).toList();
  }
}
