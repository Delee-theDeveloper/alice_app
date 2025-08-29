import 'package:flutter/material.dart';

class UserProfileSetupPage extends StatefulWidget {
  const UserProfileSetupPage({super.key});

  @override
  State<UserProfileSetupPage> createState() => _UserProfileSetupPageState();
}

class _UserProfileSetupPageState extends State<UserProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;

  // Controllers
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _emergencyNameController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();

  String? _relationship;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE0F2FE), // light blue
              Color(0xFFF8FAFC), // light gray/white
              Color(0xFFE0F2FE), // light blue
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back, color: Colors.grey[700]),
                      ),
                      const Text(
                        "Profile Setup",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Progress Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Step 1 of 3", style: TextStyle(color: Colors.grey)),
                      Text("33%",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: 0.33,
                      backgroundColor: Colors.grey[300],
                      color: Colors.blue,
                      minHeight: 8,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Avatar Section
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: const NetworkImage(
                          "https://storage.googleapis.com/uxpilot-auth.appspot.com/avatars/avatar-1.jpg",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 4, right: 4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Tap to change photo",
                      style: TextStyle(color: Colors.grey)),

                  const SizedBox(height: 24),

                  // Input Fields
                  _buildInput("Full Name *", "Enter your full name",
                      controller: _nameController),
                  _buildInput("Phone Number *", "(555) 123-4567",
                      controller: _phoneController,
                      keyboard: TextInputType.phone),
                  _buildDropdown("Relation to Special User", [
                    "Parent",
                    "Guardian",
                    "Sibling",
                    "Caregiver",
                    "Family Member",
                    "Support Worker",
                    "Self",
                    "Other"
                  ]),
                  _buildDateInput("Date of Birth *",
                      controller: _dobController),
                  _buildInput("Email Address", "your.email@example.com",
                      controller: _emailController,
                      keyboard: TextInputType.emailAddress),
                  _buildInput("Emergency Contact Name", "Contact name",
                      controller: _emergencyNameController),
                  _buildInput("Emergency Contact Phone", "Contact phone number",
                      controller: _emergencyPhoneController,
                      keyboard: TextInputType.phone),

                  const SizedBox(height: 20),

                  // Terms Box
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      border: Border.all(color: Colors.blue[200]!),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (val) =>
                              setState(() => _agreeToTerms = val!),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text.rich(
                                TextSpan(
                                  text: "I agree to the ",
                                  children: [
                                    TextSpan(
                                        text: "Terms of Service",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(text: " and "),
                                    TextSpan(
                                        text: "Privacy Policy",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Your data is encrypted and securely stored for emergency purposes only.",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 6,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _agreeToTerms) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Profile saved! Moving to Step 2")),
                          );
                          Navigator.pushNamed(context, '/setup-step2');
                        }
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text("Continue",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Skip Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/setup-step2');
                      },
                      child: const Text("Skip for Now",
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Security Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.lock, size: 14, color: Colors.grey),
                      SizedBox(width: 6),
                      Text("256-bit SSL encrypted",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, String placeholder,
      {TextEditingController? controller,
      TextInputType keyboard = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            keyboardType: keyboard,
            decoration: InputDecoration(
              hintText: placeholder,
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _relationship,
            items: options
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (val) => setState(() => _relationship = val),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateInput(String label,
      {required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                controller.text =
                    "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
              }
            },
            decoration: InputDecoration(
              hintText: "mm/dd/yyyy",
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
