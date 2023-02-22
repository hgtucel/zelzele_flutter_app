import 'package:deprem_app/ui/widgets/info_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 1)),
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    spreadRadius: -1,
                    blurRadius: 2,
                    offset: Offset(0, 1))
              ]),
              child: Text(
                "22 Şubat 2023",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            InfoWidget(),
            InfoWidget()
          ],
        ),
      ),
    );
  }
}
