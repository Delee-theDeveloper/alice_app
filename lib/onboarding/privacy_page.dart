import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

// ✅ Define privacyText outside the build
const String privacyText = """
# Privacy Policy

A.L.I.C.E. values your privacy. This Privacy Policy explains how we handle your data when using our application.  

## 1. Information We Collect  
- **User Profile Information:** Name, phone number, email, and emergency contact.  
- **Special Needs Profile Information:** Information about the individual with special needs, provided by parents/guardians.  
- **Location Data (Parents & Police only):** GPS data when enabled for safety purposes.  

## 2. How We Use Your Information  
- To support emergency response and keep individuals with special needs safe.  
- To notify parents/guardians when police or community leaders interact with their loved one.  
- To provide community leaders limited profile awareness (without sharing location).  

## 3. Data Sharing  
- **Parents/Guardians:** Full control over the profile.  
- **Police:** Access profiles and limited location data only for active, approved officers.  
- **Community Leaders:** Access limited profile details, never live location.  

## 4. Security  
All information is encrypted and stored securely using Firebase. We apply strict access rules to prevent unauthorized use.  

## 5. Your Rights  
You may update or delete your data at any time through the app.  

## 6. Changes to Privacy Policy  
This policy may be updated from time to time. Continued use of the app indicates acceptance of changes.  

If you have questions, contact our support team.
""";

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Markdown(
          data: privacyText, // ✅ now recognized
          styleSheet: MarkdownStyleSheet(
            h1: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            h2: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            p: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
