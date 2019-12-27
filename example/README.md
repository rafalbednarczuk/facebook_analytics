# facebook_analytics_example

```dart
import 'package:flutter/material.dart';
import 'package:facebook_analytics/facebook_analytics.dart';

final facebookAnalytics = FacebookAnalytics();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
```