import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // For Firebase initialization
import 'package:women_safety_app/screens/home_screen.dart';
import 'package:women_safety_app/utils/trigger_mechanism.dart';
import 'package:women_safety_app/firebase_options.dart'; // Auto-generated Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with error handling.
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Failed to initialize Firebase: $e');
  }

  // Initialize the trigger mechanism with error handling.
  try {
    await TriggerMechanism.initialize();
  } catch (e) {
    print('Failed to initialize TriggerMechanism: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Safety App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // App launches to the HomeScreen.
      home: const HomeScreen(),
    );
  }
}
