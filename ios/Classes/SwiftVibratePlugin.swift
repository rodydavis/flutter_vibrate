import Flutter
import UIKit
import AudioToolbox

private let isDevice = {
  #if targetEnvironment(simulator)
      return false
  #else
      return true
  #endif
}()

public class SwiftVibratePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "vibrate", binaryMessenger: registrar.messenger())
    let instance = SwiftVibratePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch (call.method) {
          case "canVibrate":
              if isDevice {
                result(true)
              } else {
                result(false)
              }
          case "vibrate":
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            // Feedback
          case "impact":
            if #available(iOS 10.0, *) {
              let impact = UIImpactFeedbackGenerator()
              impact.prepare()
              impact.impactOccurred()
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
          case "selection":
            if #available(iOS 10.0, *) {
              let selection = UISelectionFeedbackGenerator()
              selection.prepare()
              selection.selectionChanged()
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
          case "success":
            if #available(iOS 10.0, *) {
              let notification = UINotificationFeedbackGenerator()
              notification.prepare()
              notification.notificationOccurred(.success)
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
          case "warning":
            if #available(iOS 10.0, *) {
              let notification = UINotificationFeedbackGenerator()
              notification.prepare()
              notification.notificationOccurred(.warning)
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
          case "error":
            if #available(iOS 10.0, *) {
              let notification = UINotificationFeedbackGenerator()
              notification.prepare()
              notification.notificationOccurred(.error)
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
          case "heavy":
            if #available(iOS 10.0, *) {
              let generator = UIImpactFeedbackGenerator(style: .heavy)
              generator.prepare()
              generator.impactOccurred()
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
         case "medium":
            if #available(iOS 10.0, *) {
              let generator = UIImpactFeedbackGenerator(style: .medium)
              generator.prepare()
              generator.impactOccurred()
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
         case "light":
            if #available(iOS 10.0, *) {
              let generator = UIImpactFeedbackGenerator(style: .light)
              generator.prepare()
              generator.impactOccurred()
            } else {
              // Fallback on earlier versions
              AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
          default:
              result(FlutterMethodNotImplemented)
      }
    }
}
