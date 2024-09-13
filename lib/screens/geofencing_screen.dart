import 'package:flutter/material.dart';
import 'package:geofence/geofence.dart';

class GeofencingScreen extends StatefulWidget {
  @override
  _GeofencingScreenState createState() => _GeofencingScreenState();
}

class _GeofencingScreenState extends State<GeofencingScreen> {
  @override
  void initState() {
    super.initState();

    Geofence.initialize();

    Geofence.startGeofenceService(
        pointedLatitude: 37.4219983, // Set safe zone latitude
        pointedLongitude: -122.084, // Set safe zone longitude
        radiusMeter: 200, // Geofence radius in meters
        eventPeriodInSeconds: 5);

    Geofence.onGoeDataUpdated.listen((geofenceData) {
      print(geofenceData.toMap());
    });

    Geofence.onGeofenceStatusChanged.listen((GeofenceStatus status) {
      if (status == GeofenceStatus.EXIT) {
        print("You've exited the safe zone!");
        // Trigger panic alert here
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geofencing'),
      ),
      body: Center(child: Text('Monitoring your safety zones')),
    );
  }
}
