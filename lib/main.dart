import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/screens/auth_screen.dart';
import 'package:women_safety_app/screens/home_screen.dart';
import 'package:women_safety_app/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class WomenSafetyApp extends StatelessWidget {
  // Initialize Firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize Firebase in FutureBuilder to ensure the app doesn't start until Firebase is ready
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Error initializing Firebase: ${snapshot.error}"),
              ),
            ),
          );
        }

        // Show loading screen while Firebase is initializing
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        // Once Firebase is initialized, show the app
        return MaterialApp(
          title: 'Women Safety App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthService().getUser() == null ? AuthScreen() : HomeScreen(),
        );
      },
    );
  }
}
