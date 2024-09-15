import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  // GraphHopper API key for reverse geocoding requests
  static const String _apiKey = 'bb492fbc-a308-4f29-9742-6aa01fd3f8d3';  // Replace with your GraphHopper API key

  // Get the current GPS location of the user.
  static Future<Position> getCurrentLocation() async {
    // Request location permissions from the user if not already granted.
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return an error.
      throw Exception('Location services are disabled.');
    }

    // Check for location permissions.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission from the user if it was denied previously.
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are still denied, return an error.
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle accordingly.
      throw Exception('Location permissions are permanently denied, we cannot request permissions.');
    }

    // Define location settings with high accuracy and a 10-meter distance filter.
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, // High accuracy for emergency services
      distanceFilter: 10, // Updates every time the user moves more than 10 meters
    );

    // Request the current position with the specified settings
    return await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  }

  // Use GraphHopper's reverse geocoding to convert latitude/longitude into a human-readable address.
  static Future<String> getAddressFromCoordinates(double latitude, double longitude) async {
    // Build the URL for the reverse geocoding API call to GraphHopper
    final String url = 'https://graphhopper.com/api/1/geocode?reverse=true&point=$latitude,$longitude&key=$_apiKey';

    try {
      // Send a GET request to the GraphHopper API
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse the response JSON if the API call was successful
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['hits'] != null && data['hits'].isNotEmpty) {
          // Extract the address from the first result in the response
          final hit = data['hits'][0];
          String displayAddress = '${hit['name'] ?? ''}, '
              '${hit['state'] ?? ''}, '
              '${hit['country'] ?? ''}';
          return displayAddress;
        } else {
          return 'No address found';
        }
      } else {
        // Handle the case when the API response is not successful
        return 'Failed to retrieve address';
      }
    } catch (e) {
      // Catch and return any errors during the API call
      return 'Error: $e';
    }
  }
}
