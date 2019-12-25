# facebook_analytics
[pub package](https://pub.dartlang.org/packages/facebook_analytics)

Flutter Package implementing Facebook Analytics.

## Example

```dart
import 'package:facebook_analytics/facebook_analytics.dart';
final facebookAnalytics = FacebookAnalytics();
...
RaisedButton(onPressed: () {
    facebookAnalytics.logEvent(
      name: "test_event",
      parameters: {"value": 10, "subname": "exampleStringValue"},
    );
  })
```