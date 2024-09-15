import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:women_safety_app/screens/sos_screen.dart';
import 'package:women_safety_app/utils/sms_service.dart';
import 'package:women_safety_app/utils/location_service.dart';

class TriggerMechanism {
  // Define a MethodChannel to communicate between Flutter and native Android/iOS code.
  static const platform = MethodChannel('com.example.women_safety_app/trigger');

  // Initialize the mechanism to listen for volume button presses.
  static Future<void> initialize() async {
    // Set a method call handler to capture native events (like volume button presses).
    platform.setMethodCallHandler((call) async {
      if (call.method == 'volumeButtonPressed') {
        // Call the method to handle volume button press when detected.
        _onVolumeButtonPressed();
      }
    });
  }

  // Internal state to count the number of volume button presses.
  static int _pressCount = 0;

  // The required number of volume button presses to trigger the SOS.
  static const int _requiredPresses = 5;

  // Trusted contact's phone number (can be dynamically set from user preferences).
  static String trustedContact = '1234567890';

  // This function is called when a volume button press is detected.
  static void _onVolumeButtonPressed() async {
    _pressCount++;
    print('Volume button pressed $_pressCount time(s)'); // For debugging.

    // Check if the required number of presses is reached.
    if (_pressCount >= _requiredPresses) {
      _triggerSOS();
      _pressCount = 0; // Reset the counter after triggering the SOS.
    }
  }

  // Trigger the SOS feature (integrated with SMS and navigation).
  static Future<void> _triggerSOS() async {
    print('SOS triggered!'); // For debugging.

    // Fetch the current location of the user.
    Position currentLocation = await LocationService.getCurrentLocation();

    // Fetch the address from the coordinates (if needed).
    String address = await LocationService.getAddressFromCoordinates(
      currentLocation.latitude,
      currentLocation.longitude,
    );

    // Send SOS message with current location to the trusted contact.
    await SmsService.sendSosMessage(trustedContact, currentLocation, address);

    // Navigate to the SOS screen (UI interaction).
    // You will need to pass the `BuildContext` from the UI where this function is called.
    // For example, call _triggerSOS(context) from a widget.
    // Example:
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SOSScreen()));
  }
}
