import Flutter
import UIKit

public class LocalNetworkPlugin: NSObject, FlutterPlugin {
    let localNetworkPrivacy = LocalNetworkPrivacy()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.njovy.libs/local_network", binaryMessenger: registrar.messenger())
        let instance = LocalNetworkPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "checkLocalNetworkAccess":
            if #available(iOS 14, *) {
                localNetworkPrivacy.checkAccessState { granted in
                    result(granted)
                }
            } else {
                result(true)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
