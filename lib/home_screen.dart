import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("A.L.I.C.E. Home")),
      body: const Center(
        child: Text(
          "Welcome! You are logged in ✅",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
