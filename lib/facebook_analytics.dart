import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Facebook Analytics API
class FacebookAnalytics {
  static final FacebookAnalytics _instance =
      FacebookAnalytics.private(const MethodChannel('facebook_analytics'));

  final MethodChannel _channel;

  ///Factory providing access for [_instance]
  factory FacebookAnalytics() => _instance;

  ///Constructor for creating [_instance] and mocking using [platformChannel]
  @visibleForTesting
  FacebookAnalytics.private(MethodChannel platformChannel)
      : _channel = platformChannel;

  /// Logs a custom Flutter Facebook event with the given [name] and event [parameters].
  Future<void> logEvent(
      {@required String name, Map<String, dynamic> parameters}) async {
    await _channel
        .invokeListMethod('logEvent', {"name": name, "parameters": parameters});
  }

//TODO: Add Observer in order to track PageRoute Transition like FirebaseAnalytics
/*
  Future<void> setCurrentScreen(
      {@required String screenName,
      String screenClassOverride = 'Flutter'}) async {
    if (screenName == null) {
      throw ArgumentError.notNull('screenName');
    }

    await _channel.invokeMethod<void>('setCurrentScreen', <String, String>{
      'screenName': screenName,
      'screenClassOverride': screenClassOverride,
    });
  }
*/
}
