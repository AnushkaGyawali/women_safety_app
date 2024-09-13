// lib/screens/tips_screen.dart

import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  final List<String> safetyTips = [
    'Always be aware of your surroundings.',
    'Share your location with trusted contacts.',
    'Avoid isolated areas during late hours.',
    'Keep emergency contacts handy.',
    'Trust your instincts in uncomfortable situations.',
    'Report harassment or unsafe behavior promptly.',
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
            leading: Icon(Icons.info_outline),
          );
        },
      ),
    );
  }
}
