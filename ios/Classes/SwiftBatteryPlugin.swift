import Flutter
import UIKit

public class SwiftBatteryPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "battery", binaryMessenger: registrar.messenger())
    let instance = SwiftBatteryPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      let device : UIDevice
      
      device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      
     if(call.method == "getBatteryLevel"){
         let reading : Int = getBatteryLevel(device)
         result(reading)
     } else if(call.method == "isCharging"){
         let reading : Bool = isCharging(device)
         result(reading)
     } else if(call.method ==  "timeToFinishCharge"){
         result(nil)
     }else {
      result("iOS " + UIDevice.current.systemVersion)
     }

  }
    
    private func getBatteryLevel(_ device : UIDevice) -> Int {
        
        return Int(device.batteryLevel * 100)
    }
    
    private func isCharging(_ device: UIDevice) -> Bool {
        return device.batteryState == UIDevice.BatteryState.charging
    }
}
