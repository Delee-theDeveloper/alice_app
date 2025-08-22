import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'onboarding/onboarding_flow.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'paywall_screen.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AliceApp());
}

class AliceApp extends StatelessWidget {
  const AliceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A.L.I.C.E.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthGate(),
        '/onboarding': (context) => const OnboardingFlow(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupPage(),
        '/paywall': (context) => const PaywallScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // First time user or logged out → Show Onboarding
        final user = snapshot.data;
        if (user == null) {
          return const OnboardingFlow();
        }

        // Already logged in → Check Firestore for trial info
        return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection("users")
              .doc(user.uid)
              .get(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            final userData = userSnapshot.data?.data();
            if (userData == null || !userData.containsKey("trialEndDate")) {
              return const PaywallScreen(); // No trial → show paywall
            }

            final trialEndDate =
                (userData["trialEndDate"] as Timestamp).toDate();
            final now = DateTime.now();

            if (now.isAfter(trialEndDate)) {
              return const PaywallScreen(); // Trial expired
            } else {
              return const HomeScreen(); // Trial active
            }
          },
        );
      },
    );
  }
}
