import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapWidget extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    // Initialize the map controller
    mapController = MapController();
  }

  @override
  void dispose() {
    // Dispose of the map controller when the widget is disposed
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: mapController,
      trackMyPosition: true,
      initZoom: 12,
      minZoomLevel: 7,
      maxZoomLevel: 18,
      userLocationMarker: UserLocationMaker(
        personMarker: MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.red,
            size: 48,
          ),
        ),
        directionArrowMarker: MarkerIcon(
          icon: Icon(
            Icons.navigation,
            color: Colors.blue,
            size: 48,
          ),
        ),
      ),
      roadConfiguration: RoadConfiguration(
        startIcon: MarkerIcon(
          icon: Icon(
            Icons.location_on,
            color: Colors.green,
            size: 48,
          ),
        ),
        endIcon: MarkerIcon(
          icon: Icon(
            Icons.location_off,
            color: Colors.blue,
            size: 48,
          ),
        ),
      ),
      onMapIsReady: (isReady) async {
        if (isReady) {
          // Center the map on the provided coordinates once it's ready
          await mapController.setZoom(zoomLevel: 12);
          await mapController.changeLocation(
            GeoPoint(latitude: widget.latitude, longitude: widget.longitude),
          );
        }
      },
      onGeoPointClicked: (GeoPoint point) {
        // Handle tap on map markers if needed
        print("Tapped on marker at: ${point.latitude}, ${point.longitude}");
      },
      // Single marker representing the user's location
      staticPoints: [
        StaticPositionGeoPoint(
          "userMarker",
          MarkerIcon(
            icon: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 48,
            ),
          ),
          [
            GeoPoint(latitude: widget.latitude, longitude: widget.longitude),
          ],
        ),
      ],
    );
  }
}
