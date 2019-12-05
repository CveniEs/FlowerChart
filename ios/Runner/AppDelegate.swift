import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let log = FlutterMethodChannel(name: "flower_chart_io/log", binaryMessenger: controller.binaryMessenger)
    log.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
        FlutterLog.flutterLog(call: call, resutl: result)
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
