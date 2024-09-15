// sos_screen.dart
import 'package:flutter/material.dart';
import 'package:women_safety_app/utils/sms_service.dart';
import 'package:women_safety_app/utils/location_service.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For retrieving trusted contact

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  // Function to fetch the trusted contact from SharedPreferences
  Future<String?> _getTrustedContact() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('trusted_contact'); // Fetch stored trusted contact
  }

  // Function to handle the SOS logic
  Future<void> _sendSos(BuildContext context) async {
    try {
      // Fetch current location from GPS.
      final location = await LocationService.getCurrentLocation();

      // Fetch address or human-readable location using reverse geocoding.
      final address = await LocationService.getAddressFromCoordinates(
          location.latitude, location.longitude);

      // Retrieve trusted contact from SharedPreferences
      final trustedContact = await _getTrustedContact();

      if (trustedContact != null && trustedContact.isNotEmpty) {
        // Send SMS to trusted contact with the SOS message including location data.
        await SmsService.sendSosMessage(trustedContact, location, address);

        // Show confirmation after sending the SOS message.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SOS message sent successfully!')),
        );
      } else {
        // Handle case where no trusted contact is found.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No trusted contact found. Please set one in settings.')),
        );
      }
    } catch (e) {
      // Handle any error that occurs during the process
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sending SOS: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Feature'),
      ),
      body: Center(
        child: ElevatedButton(
          // When pressed, sends the SOS message with location data.
          onPressed: () => _sendSos(context), // Call the SOS handling function
          child: const Text('Send SOS'),
        ),
      ),
    );
  }
}
