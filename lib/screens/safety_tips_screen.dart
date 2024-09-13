import 'package:flutter/material.dart';

class SafetyTipsScreen extends StatelessWidget {
  final List<String> safetyTips = [
    'Stay aware of your surroundings.',
    'Share your travel plans with trusted people.',
    'Avoid walking alone at night.',
    'Keep your phone charged at all times.',
    'Trust your instincts.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safety Tips'),
      ),
      body: ListView.builder(
        itemCount: safetyTips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(safetyTips[index]),
          );
        },
      ),
    );
  }
}
