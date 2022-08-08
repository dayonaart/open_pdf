import Flutter
import UIKit

public class SwiftOpenPdfPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "open_pdf", binaryMessenger: registrar.messenger())
    let instance = SwiftOpenPdfPlugin()
    let factory = FLNativeViewFactory(messenger: registrar.messenger())
    factory.registrar = registrar
    registrar.register(factory, withId: "text")
    registrar.addMethodCallDelegate(instance, channel: channel)
   
    }

 
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if call.method=="open" {
  
          result("success")
          
      }
  }
}
