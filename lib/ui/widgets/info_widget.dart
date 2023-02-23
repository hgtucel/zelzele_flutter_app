import 'package:deprem_app/models/earthquake_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class InfoWidget extends StatelessWidget {
  final EarthquakeModel? earthquakeModel;
  const InfoWidget({super.key, this.earthquakeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topRight,
              colors: [Color(0xFFfefefe),Color(0xFFf4f4f5), ])),
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
              earthquakeModel?.size ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                earthquakeModel?.city ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 20, height: 1.25),
              ),
              Text(
                earthquakeModel?.district ?? "",
                style: const TextStyle(
                    fontSize: 20,
                    height: 1.75,
                    color: Color.fromRGBO(24, 24, 27, 0.5)),
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text(
                    "${earthquakeModel?.depth} km",
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: Color.fromRGBO(24, 24, 27, 0.5)),
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
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: Color.fromRGBO(24, 24, 27, 0.5)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: const Text(
                      "/",
                      style: TextStyle(color: Color.fromRGBO(24, 24, 27, 0.4)),
                    ),
                  ),
                  Text(
                    Jiffy(DateTime(2023,02,23,11,25)).fromNow(),
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: Color.fromRGBO(24, 24, 27, 0.5)),
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
