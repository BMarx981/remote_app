import UIKit
import Flutter
import ConnectSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private var device: ConnectableDevice?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "connectsdk/flutter", binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler { [weak self] (call, result) in
            guard let self = self else { return }
            switch call.method {
                case "turnOn":
                    self.device?.powerControl?.powerOn()
                    result(true)
                case "turnOff":
                    self.device?.powerControl?.powerOff()
                    result(true)
                case "increaseVolume":
                    self.device?.volumeControl?.volumeUp()
                    result(true)
                case "decreaseVolume":
                    self.device?.volumeControl?.volumeDown()
                    result(true)
                default:
                    result(FlutterMethodNotImplemented)
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
