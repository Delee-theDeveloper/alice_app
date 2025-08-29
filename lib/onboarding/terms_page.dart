import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context), // Go back
        ),
        title: const Text(
          "Terms of Service",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: const Text(
          """
Welcome to A.L.I.C.E.!

These Terms of Service govern your use of the application. By using the app, you agree to the following:

1. **Purpose of the App**  
   A.L.I.C.E. provides parents, caregivers, police, and community leaders with information about individuals with special needs to promote safety and understanding.  

2. **Data Responsibility**  
   Parents/guardians are responsible for the accuracy of the information they provide.  

3. **Privacy**  
   Your data is encrypted and securely stored. Personal information will not be shared without your consent, except where required for emergency response or legal purposes.  

4. **User Roles**  
   - Parents/Guardians create and manage profiles.  
   - Police officers may view profiles for emergency purposes.  
   - Community leaders have limited access to non-location data.  

5. **Limitations of Liability**  
   We do our best to provide accurate and timely information, but we are not responsible for technical issues, delays, or inaccuracies beyond our control.  

6. **Changes to Terms**  
   These Terms may be updated from time to time. Continued use of the app indicates acceptance of changes.  

If you have questions, contact our support team.
          """,
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}
