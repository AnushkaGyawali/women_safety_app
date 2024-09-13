import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  void _submitReport(BuildContext context) {
    final String report = _controller.text;
    if (report.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Report Submitted Successfully')),
      );
      _controller.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a report')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anonymous Reporting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your report here'),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitReport(context),
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }
}
