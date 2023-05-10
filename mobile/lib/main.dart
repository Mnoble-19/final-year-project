import 'package:flutter/material.dart';
import 'package:mobile/constants/constants.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/screens/payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Tolls',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: 'HKGrotesk',
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
          bodySmall: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: 'HKGrotesk',
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
    );
  }
}
