import 'package:flutter/material.dart';
import 'package:Etolls/provider.dart'; // Update this line
import 'package:Etolls/screens/login_screen.dart'; // Update this line
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:Etolls/screens/home.dart'; // Update this line
import 'package:Etolls/constants/constants.dart'; // Update this line



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> HomeDashboardProvider()),
      ],
      child: MaterialApp(
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

        home: const LoginScreen(),

      ),
    );
  }
}
