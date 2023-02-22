import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              end: Alignment.topRight,
              colors: [Color(0xFFfefefe),Color(0xFFf4f4f5), ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                borderRadius: BorderRadius.circular(12)),
            child: Text(
              "2.4",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Kahramanmaraş",
                style: TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 20, height: 1.25),
              ),
              Text(
                "Nurhak",
                style: TextStyle(
                    fontSize: 20,
                    height: 1.75,
                    color: Color.fromRGBO(24, 24, 27, 0.5)),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text(
                    "6.97 km",
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: Color.fromRGBO(24, 24, 27, 0.5)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      "/",
                      style: TextStyle(color: Color.fromRGBO(24, 24, 27, 0.4)),
                    ),
                  ),
                  Text(
                    "6.97 km",
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.25,
                        color: Color.fromRGBO(24, 24, 27, 0.5)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      "/",
                      style: TextStyle(color: Color.fromRGBO(24, 24, 27, 0.4)),
                    ),
                  ),
                  Text(
                    "31 dakika önce",
                    style: TextStyle(
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
