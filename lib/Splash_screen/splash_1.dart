
import 'package:app10/Splash_screen/splash_2.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1();
}

class _Splash1 extends State<Splash1> {
  @override
  void initState() {
    super.initState();

    // Wait 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Splash2()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              "assets/logo.png",
              height: 120,
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}