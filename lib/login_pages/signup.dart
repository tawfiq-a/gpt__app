import 'package:app10/login_pages/login_screen.dart';
import 'package:app10/login_pages/verify_email.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Dark background color
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 150),

              // App Logo
              Image.asset(
                'assets/logo.png', // Placeholder for the app logo
                height: 100,
              ),
              const SizedBox(height: 120),

              // Name Input Field
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.person_outline, color: Color(0xFFC9C9C9)),
                ),
              ),
              const SizedBox(height: 16),

              // Email Input Field
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFC9C9C9)),
                ),
              ),
              const SizedBox(height: 16),

              // Password Input Field
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFC9C9C9)),
                  suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xFFC9C9C9)),
                ),
              ),
              const SizedBox(height: 16),

              // Re-enter Password Input Field
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Re-enter your password',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.05),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFC9C9C9)),
                  suffixIcon: const Icon(Icons.visibility_off_outlined, color: Color(0xFFC9C9C9)),
                ),
              ),
              const SizedBox(height: 40), // Increased space before the button

              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // This is how you use Navigator.push
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VerifyEmail(), // Navigates to the verifyemail Screen
                    ),
                  );
                  // TODO: Implement signup logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB3FF21), // Neon yellow/green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color for the button
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // "Already have an account? Login" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Login page
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: const Text(
                      'Login',
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
}