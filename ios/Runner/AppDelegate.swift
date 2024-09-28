import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Disable screenshots and screen recording
    if let window = UIApplication.shared.windows.first {
        window.isHidden = true // Disable screen mirroring and screenshot capturing
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
