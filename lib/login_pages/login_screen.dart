import 'package:app10/app_screen/home_screen.dart';
import 'package:app10/login_pages/otp_page.dart';
import 'package:app10/login_pages/signup.dart';
import 'package:flutter/material.dart';


import 'forgot_page.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // Dark background color
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 110),

              // App Logo
              Image.asset(
                'assets/logo.png', // Placeholder for the app logo
                height: 70,
              ),
              const SizedBox(height: 90),

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
              const SizedBox(height: 20),

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
              const SizedBox(height: 15),

              // "Forgot Password?" link
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ForgotPage()),
                    );
                  },
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.lightGreenAccent, // Neon yellow/green color
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()
                      ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB3FF21), // Neon yellow/green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color for the button
                  ),
                ),
              ),
              const SizedBox(height: 35),

              // "or, continue with" divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or, continue with',
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 40),

              // Social media buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _socialButton(
                    'assets/google.png', // Google logo
                        () {},
                  ),
                  _socialButton(
                    'assets/facebook.png', // Facebook logo
                        () {},
                  ),
                  _socialButton(
                    'assets/apple.png', // Apple logo
                        () {},
                  ),
                ],
              ),
              const SizedBox(height: 45),

              // "Don't have an account? Sign Up" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // This is how you use Navigator.push
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Signup(), // Navigates to the DetailScreen
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
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

  // Helper widget for social media buttons
  Widget _socialButton(String assetPath, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: const BorderSide(color: Colors.lightGreenAccent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Image.asset(
            assetPath,
            height: 50,
            width: 40,
          ),
        ),
      ),
    );
  }
}