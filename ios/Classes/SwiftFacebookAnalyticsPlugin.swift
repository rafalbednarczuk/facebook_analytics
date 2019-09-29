import Flutter
import UIKit
import FBSDKCoreKit

public class SwiftFacebookAnalyticsPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "facebook_analytics", binaryMessenger: registrar.messenger())
        let instance = SwiftFacebookAnalyticsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if(call.method == "logEvent"){
            guard let args = call.arguments else {
                return
            }
            if let myArgs = args as? [String: Any],
                let eventName = myArgs["name"] as? String,
                let parameters = myArgs["parameters"] as? [String: Any]
            {
                let event = AppEvent(name: eventName, parameters: parameters)
                AppEventsLogger.log(event)
            } else if
                let myArgs = args as? [String: Any],
                let eventName = myArgs["name"] as? String
            {
                let event = AppEvent(name: eventName)
                AppEventsLogger.log(event)
            }
        }
    }
}
