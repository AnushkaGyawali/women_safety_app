//sms_service.dart
import 'package:telephony/telephony.dart';
import 'package:geolocator/geolocator.dart';

class SmsService {
  // Send SOS message to the given phone number with location and address.
  // Parameters:
  // - phoneNumber: The trusted contact's phone number.
  // - location: The GPS coordinates of the user's current location.
  // - address: The textual address corresponding to the user's location.
  static Future<void> sendSosMessage(
      String phoneNumber,
      Position location,
      String address,
      ) async {
    // Initialize Telephony instance to use device SMS capabilities.
    final Telephony telephony = Telephony.instance;

    // Send an SMS containing the emergency message, including the location (address and coordinates).
    try {
      await telephony.sendSms(
        to: phoneNumber,
        message: 'SOS! My location is: $address. '
            'GPS coordinates: ${location.latitude}, ${location.longitude}',
        // Ensure SMS delivery confirmation (optional based on needs).
        statusListener: (SendStatus status) {
          if (status == SendStatus.SENT) {
            print('SOS message successfully sent.');
          } else if (status == SendStatus.DELIVERED) {
            print('SOS message delivered to the recipient.');
          } else {
            print('Failed to send SOS message.');
          }
        },
      );
    } catch (e) {
      // Handle any SMS sending failures such as permission denial or network issues.
      print('Error sending SOS message: $e');
    }
  }
}
