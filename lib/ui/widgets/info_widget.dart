import 'package:deprem_app/core/extension/num_extension.dart';
import 'package:deprem_app/models/earthquake_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class InfoWidget extends StatelessWidget {
  final EarthquakeModel? earthquakeModel;
  const InfoWidget({super.key, this.earthquakeModel});

  List<Color> gradientColors(num size) {
    if (size.isBetween(3, 4)) {
      return const [Color(0xFFfefefe), Color(0xFFdbeafe)];
    } else if (size.isBetween(4, 6)) {
      return const [Color(0xFFfefefe), Color(0xFFfef9c3)];
    } else if (size.isBetween(6, 7)) {
      return const [Color(0xFFfefefe), Color(0xFFffedd5)];
    } else if (size >= 7) {
      return const [Color(0xFFfefefe), Color(0xFFfee2e2)];
    }
    return const [Color(0xFFfefefe), Color(0xFFf4f4f5)];
  }

  Color textColors(num size) {
    if (size >= 3) {
      return const Color.fromRGBO(30, 58, 138, 1);
    } else if (size >= 4) {
      return const Color.fromRGBO(113, 63, 18, 1);
    } else if (size >= 6) {
      return const Color.fromRGBO(124, 45, 18, 1);
    } else if (size >= 7) {
      return const Color.fromRGBO(124, 29, 29, 1);
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topRight,
              colors: gradientColors(earthquakeModel?.size ?? 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              "${earthquakeModel?.size ?? ""}",
              style: TextStyle(color: textColors(earthquakeModel?.size ?? 1),fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                earthquakeModel?.city ?? "",
                style: TextStyle(
                    color: textColors(earthquakeModel?.size ?? 1),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 1.25),
              ),
              Text(
                earthquakeModel?.district ?? "",
                style: TextStyle(
                    fontSize: 20,
                    height: 1.75,
                    color: textColors(earthquakeModel?.size ?? 1).withOpacity(0.6)),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "${earthquakeModel?.depth} km",
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: textColors(earthquakeModel?.size ?? 1).withOpacity(0.7)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: const Text(
                      "/",
                      style: TextStyle(color: Color.fromRGBO(24, 24, 27, 0.4)),
                    ),
                  ),
                  Text(
                    "${earthquakeModel?.time?.split(" ").last}",
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: textColors(earthquakeModel?.size ?? 1).withOpacity(0.7)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: const Text(
                      "/",
                      style: TextStyle(color: Color.fromRGBO(24, 24, 27, 0.4)),
                    ),
                  ),
                  Text(
                    Jiffy(DateTime.parse(earthquakeModel?.time ?? "")).fromNow(),
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: textColors(earthquakeModel?.size ?? 1).withOpacity(0.7)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
