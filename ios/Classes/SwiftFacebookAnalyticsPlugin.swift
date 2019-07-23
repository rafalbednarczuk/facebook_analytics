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
                result("iOS could not recognize flutter arguments in method: (logEvent)")
                return
            }
            if let myArgs = args as? [String: Any],
                let eventName = myArgs["name"] as? String,
                let parameters = myArgs["parameters"] as? [String: Any]
            {
                FBSDKAppEvents.logEvent(eventName, parameters: parameters)
            } else if
                let myArgs = args as? [String: Any],
                let eventName = myArgs["name"] as? String
            {
                FBSDKAppEvents.logEvent(eventName)
            } else {
                result("iOS could not extract flutter arguments in method: (logEvent)")
            }
            result("ok")
        }
        result("dupa")
       }
}
