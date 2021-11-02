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
    let methodChannel = FlutterMethodChannel(name: "demo.gawkat.com/info", binaryMessenger: controller.binaryMessenger)

    methodChannel.setMethodCallHandler({(call: FlutterMethodCall, result:FlutterResult)-> Void in
        if call.method == "getMessage" {
            //let version = UIDevice().systemVersion

            // get arguments
            //let name = ""
            //let source = ""
            var message = ""

            if let args = call.arguments as? Dictionary<String, Any>,
                let from = args["from"] as? String
            {
               message = "iOS welcomes " + from
            } else {
               result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
            }

            if let args2 = call.arguments as? Dictionary<String, Any>,
                let source = args2["source"] as? String
            {
                message = message + " your code is here: " + source
            } else {
                result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
            }
            result(message)
            /* org
            if let args = call.arguments as? Dictionary<String, Any>,
                let from = args["from"] as? String {
                  // please check the "as" above  - wasn't able to test
                  // handle the method
                    let message = "iOS say: hi " + from
                result(message)
              } else {
                result(FlutterError.init(code: "errorSetDebug", message: "data or format error", details: nil))
              }
            */


            //result(version)
        } else {
            result(FlutterMethodNotImplemented)
        }

    })


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
