import Flutter
import UIKit
import Firebase
@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
<<<<<<< HEAD
  FirebaseApp.configure()
=======
    FirebaseApp.configure()
>>>>>>> c990ab51feded3b070508858f4bea2a5e82d96b1
    GeneratedPluginRegistrant.register(with: self)

    // Disable screenshots and screen recording
    if let window = UIApplication.shared.windows.first {
        window.isHidden = true // Disable screen mirroring and screenshot capturing
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
