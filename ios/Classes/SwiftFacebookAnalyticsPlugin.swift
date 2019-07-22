import Flutter
import UIKit

public class SwiftFacebookAnalyticsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "facebook_analytics", binaryMessenger: registrar.messenger())
    let instance = SwiftFacebookAnalyticsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
