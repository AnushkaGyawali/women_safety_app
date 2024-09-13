import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class GeofencingService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> startGeofencing(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Location permissions are denied')),
        );
        return;
      }
    }

    Geolocator.getPositionStream().listen((Position position) {
      // Define boundaries for your safe/unsafe zones
      double safeZoneLat = 37.7749;
      double safeZoneLong = -122.4194;
      double distanceToSafeZone = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        safeZoneLat,
        safeZoneLong,
      );

      if (distanceToSafeZone > 1000) {
        _triggerGeofenceAlert(context);
      }
    });
  }

  static Future<void> _triggerGeofenceAlert(BuildContext context) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'geofencing_channel',
      'Geofencing Alerts',
      'Alerts when entering unsafe zones',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.show(
      0,
      'Geofencing Alert',
      'You have entered an unsafe zone!',
      platformChannelSpecifics,
      payload: 'Geofencing Alert',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You have entered an unsafe zone!')),
    );
  }
}
