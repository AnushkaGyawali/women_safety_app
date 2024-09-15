import 'package:flutter/material.dart';

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Tips', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.security, size: 30, color: Colors.deepPurple),
              title: const Text('Tip 1: Stay aware of your surroundings.', style: TextStyle(fontSize: 16)),
              subtitle: const Text('Be mindful of your surroundings and trust your instincts.'),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.location_on, size: 30, color: Colors.deepPurple),
              title: const Text('Tip 2: Share your location with trusted contacts.', style: TextStyle(fontSize: 16)),
              subtitle: const Text('Let friends or family know where you are going and when you expect to be back.'),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.nightlight_round, size: 30, color: Colors.deepPurple),
              title: const Text('Tip 3: Avoid isolated areas at night.', style: TextStyle(fontSize: 16)),
              subtitle: const Text('Stick to well-lit areas and populated streets.'),
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.phone, size: 30, color: Colors.deepPurple),
              title: const Text('Tip 4: Keep emergency numbers handy.', style: TextStyle(fontSize: 16)),
              subtitle: const Text('Program emergency numbers into your phone and keep them easily accessible.'),
            ),
          ),
          // TODO: Add more safety tips or fetch dynamically from a database if needed.
        ],
      ),
    );
  }
}