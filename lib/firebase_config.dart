import 'package:firebase_core/firebase_core.dart';

// Replace with your Firebase project configuration
const firebaseConfig = FirebaseOptions(
  apiKey: "YOUR_API_KEY",
  appId: "YOUR_APP_ID",
  messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  projectId: "YOUR_PROJECT_ID",
  authDomain: "YOUR_AUTH_DOMAIN",
  storageBucket: "YOUR_STORAGE_BUCKET",
  measurementId: "YOUR_MEASUREMENT_ID",
);

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: firebaseConfig,
  );
}

