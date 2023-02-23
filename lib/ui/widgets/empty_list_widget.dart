import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            "Bu büyüklükte deprem yok (çok şükür)",
            style:
                TextStyle(fontSize: 18, height: 2, fontWeight: FontWeight.w500),
          ),
          Text(
            "Son gerçekleşen 100 deprem arasında",
            style: TextStyle(
                color: Colors.black.withOpacity(0.6), fontSize: 15, height: 2),
          )
        ],
      ),
    );
  }
}
