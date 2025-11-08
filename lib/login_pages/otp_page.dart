import 'package:app10/app_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for SystemChannels for keyboard control

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Dark background color
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        title: const Text(
          'OTP varification',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 180),
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) => _otpTextField(context)),
              ),
              const SizedBox(height: 60),

              // Verify Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()
                    ),
                  );// TODO: Implement email verification logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB3FF21), // Neon yellow/green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color for the button
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // "Don't get the code? Resend" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't get the code?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement resend code logic
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: Color(0xFFB3FF21), // Neon yellow/green color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for a single OTP input field
  Widget _otpTextField(BuildContext context) {
    return SizedBox(
      width: 50, // Fixed width for each OTP box
      height: 50, // Fixed height for each OTP box
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // Only allow digits
          LengthLimitingTextInputFormatter(1), // Limit to 1 character
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1), // Slightly lighter than background
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.zero, // Remove default padding
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); // Move to the next field
          } else if (value.isEmpty) {
            FocusScope.of(context).previousFocus(); // Move to the previous field on backspace
          }
        },
      ),
    );
  }
}