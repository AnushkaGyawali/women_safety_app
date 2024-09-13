import 'package:flutter/material.dart';
import 'package:women_safety_app/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService().signOut();
              Navigator.pushReplacementNamed(context, '/auth');
            },
          )
        ],
      ),
      body: Center(
        child: Text('Welcome to the Women Safety App'),
      ),
    );
  }
}
