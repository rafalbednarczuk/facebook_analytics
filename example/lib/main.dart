import 'package:flutter/material.dart';

import 'package:facebook_analytics/facebook_analytics.dart';

final facebookAnalytics = FacebookAnalytics();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
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
            facebookAnalytics.logEvent(
              name: "test_event",
              parameters: {"value": 10, "subname": "exampleStringValue"},
            );
          }),
        ),
      ),
    );
  }
}