// lib/widgets/bottom_navigation.dart

import 'package:flutter/material.dart';
import '../screens/sos_screen.dart';
import '../screens/geofence_screen.dart';
import '../screens/tips_screen.dart';
import '../screens/report_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    SOSScreen(),
    GeofenceScreen(),
    TipsScreen(),
    ReportScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages.elementAt(_selectedIndex),
    bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[

