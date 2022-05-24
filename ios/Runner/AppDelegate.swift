    
// AppDelegate.swift
import UIKit
import Flutter
import FBSDKCoreKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {          
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        GeneratedPluginRegistrant.register(with: self)
        GMSServices.provideAPIKey(infoForKey("GoogleMapsApiKey")!)

        if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }

        return true
    }
          
    func infoForKey(_ key: String) -> String? {
      return (Bundle.main.infoDictionary?[key] as? String);
    }
}
