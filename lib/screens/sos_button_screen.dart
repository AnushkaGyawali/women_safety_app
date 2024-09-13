import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:location/location.dart';

class SOSButton extends StatelessWidget {
  final LocationData userLocation;

  SOSButton({required this.userLocation});

  void sendSOS() async {
    String message = 'SOS! I need help. My location is: '
        'Latitude: ${userLocation.latitude}, '
        'Longitude: ${userLocation.longitude}.';

    List<String> recipients = ['+1234567890']; // Predefined contacts

    String result = await sendSMS(message: message, recipients: recipients)
        .catchError((onError) {
      print(onError);
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: sendSOS,
      child: Text('Send SOS'),
      style: ElevatedButton.styleFrom(primary: Colors.red),
    );
  }
}
