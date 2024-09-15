//emergency_screen.dart
import 'package:flutter/material.dart';
import 'package:women_safety_app/widgets/contact_form.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trusted Contacts'),
      ),
      body: const ContactForm(),  // Form to input and save a trusted contact.
    );
  }
}
