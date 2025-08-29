import 'package:flutter/material.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock, size: 80, color: Colors.redAccent),
            SizedBox(height: 20),
            Text(
              "Your trial has ended.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Please subscribe to continue using A.L.I.C.E."),
          ],
        ),
      ),
    );
  }
}
