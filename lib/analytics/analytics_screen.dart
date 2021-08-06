import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics'),
        elevation: 0,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Text('Analytics Screen'),
      ),
    );
  }
}
