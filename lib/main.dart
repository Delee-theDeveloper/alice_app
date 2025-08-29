import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'onboarding/user_profile_setup.dart'; // 👈 import our new page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // make sure Firebase is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A.L.I.C.E.',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/setup-step1', // 👈 Start here after login
      routes: {
        '/setup-step1': (context) => const UserProfileSetupPage(),
        // '/setup-step2': (context) => const SNProfileSetupPage(),   // next step
        // '/setup-step3': (context) => const PermissionsSetupPage(), // next step
      },
    );
  }
}
