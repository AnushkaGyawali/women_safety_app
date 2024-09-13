import 'package:flutter/material.dart';
import 'package:location/location.dart';

class RealTimeLocationScreen extends StatefulWidget {
  @override
  _RealTimeLocationScreenState createState() => _RealTimeLocationScreenState();
}

class _RealTimeLocationScreenState extends State<RealTimeLocationScreen> {
  Location location = new Location();
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Request permission to access location
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // Get the location data
    _locationData = await location.getLocation();

    // Track the user's location in real-time
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _locationData = currentLocation;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Location'),
      ),
      body: _locationData == null
          ? Center(child: CircularProgressIndicator())
          : Center(
        child: Text(
          'Latitude: ${_locationData?.latitude}, Longitude: ${_locationData?.longitude}',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
