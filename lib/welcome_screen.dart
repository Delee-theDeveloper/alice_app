import 'package:flutter/material.dart';
import 'signup_page.dart'; // make sure this exists

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2FE), Color(0xFFF8FAFC), Color(0xFFE0F2FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ✅ Official Logo
                Image.asset(
                  "assets/images/A.L.I.C.E_Official_Logo.png",
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),

                // ✅ Title
                const Text(
                  "A.L.I.C.E.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),

                const Text(
                  "Autism.\nLife.\nIntelligence.\nConnecting.\nEngineering.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // ✅ Description
                const Text(
                  "Protecting individuals with autism and other special needs through "
                  "real-time communication and safety alerts between caregivers and law enforcement.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),

                // ✅ Mission Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "Our Mission",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\"Bridging safety. Saving lives. Empowering independence.\"",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ✅ Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Icon(Icons.favorite, color: Colors.blue),
                        SizedBox(height: 4),
                        Text("Caring"),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: const [
                        Icon(Icons.lock, color: Colors.blue),
                        SizedBox(height: 4),
                        Text("Secure"),
                      ],
                    ),
                    const SizedBox(width: 40),
                    Column(
                      children: const [
                        Icon(Icons.people, color: Colors.blue),
                        SizedBox(height: 4),
                        Text("Connected"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // ✅ Let’s Begin Button (navigates to SignUp)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Let’s Begin →",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // ✅ Footer Text
                const Text(
                  "🔒 Secure   ⭐ Trusted   ❤️ Caring",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
