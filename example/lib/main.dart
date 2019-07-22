import 'package:flutter/material.dart';

import 'package:facebook_analytics/facebook_analytics.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FacebookAnalytics _analytics;

  @override
  void initState() {
    super.initState();
    _analytics = FacebookAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(onPressed: () {
            _analytics.logEvent(name: "test_event");
          }),
        ),
      ),
    );
  }
}
