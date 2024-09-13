import 'package:flutter/material.dart';
import 'package:women_safety_app/screens/real_time_location_screen.dart';
import 'package:women_safety_app/screens/sos_button_screen.dart';
import 'package:women_safety_app/screens/report_screen.dart';
import 'package:women_safety_app/screens/safety_tips_screen.dart';
import 'package:women_safety_app/screens/geofencing_screen.dart';

class NavigationPanel extends StatefulWidget {
  @override
  _NavigationPanelState createState() => _NavigationPanelState();
}

class _NavigationPanelState extends State<NavigationPanel> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    RealTimeLocationScreen(),
    SOSButtonScreen(),
    ReportScreen(),
    SafetyTipsScreen(),
    GeofencingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'SOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Safety Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Geofencing',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
