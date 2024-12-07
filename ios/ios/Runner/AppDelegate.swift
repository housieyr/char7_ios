import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
<<<<<<< HEAD:ios/Runner/AppDelegate.swift

  FirebaseApp.configure()

 
=======
>>>>>>> ff7fc93 (Resolved merge conflicts):ios/ios/Runner/AppDelegate.swift
    GeneratedPluginRegistrant.register(with: self)
     // Disable screenshots and screen recording
    // Add secure flag to block screenshots and screen recordings
        if let window = self.window {
            window.isHidden = false
            window.layer.contents = nil
            window.layer.addSublayer(CAShapeLayer()) // Makes it resilient to any 'visible'
        }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
