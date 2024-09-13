// lib/screens/sos_screen.dart

import 'package:flutter/material.dart';
import '../services/location_service.dart';

class SOSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final location = await LocationService().getCurrentLocation();
            // TODO: Send location to emergency contacts
            print('SOS Triggered! Location: $location');
          },
          child: Text('Send SOS'),
        ),
      ),
    );
  }
}
