import 'package:app10/Splash_screen/splash_1.dart';
import 'package:flutter/material.dart';
import 'login_pages/login_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Splash1(),
    );
  }
}