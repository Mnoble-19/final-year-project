import 'package:flutter/material.dart';
import 'package:mobile/provider.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/constants/constants.dart';


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

        home: const MyHomePage(),

      ),
    );
  }
}
