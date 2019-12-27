# facebook_analytics
[pub package](https://pub.dartlang.org/packages/facebook_analytics)

Flutter Package implementing Facebook Analytics.

## Installation
### Android
https://developers.facebook.com/quickstarts/ 
Complete only: Add SKD, App Info, Key Hashes

### iOS
https://developers.facebook.com/quickstarts/
Complete only: Configure(add XML snippet to plist), Bundle Identifier 

add this line in ios/Podfile to 9.0 (in most cases just uncomment this line in the beginning of Podfile)
`platform :ios, '9.0'`

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
