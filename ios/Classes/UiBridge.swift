//
//  UiBridge.swift
//  open_pdf
//
//  Created by Dayona on 05/08/22.
//

import Flutter
import UIKit
import WebKit


class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    var registrar: FlutterPluginRegistrar? = nil
    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        let _args=args as? NSDictionary
        let key = registrar?.lookupKey(forAsset: _args?["key"] as? String ?? "https://web.stanford.edu/class/archive/cs/cs161/cs161.1168/lecture4.pdf")
        let topPath = Bundle.main.path(forResource: key, ofType: nil)
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: topPath!,
            binaryMessenger: messenger)
    }
     func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
    
}

class FLNativeView: NSObject, FlutterPlatformView, WKNavigationDelegate, UIDocumentInteractionControllerDelegate {
    private var _view: UIView
 
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args:String,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
       
        super.init()
        // iOS views can be created here
        createNativeView(view: _view,args: args)
    }

    func view() -> UIView {
        return _view
    }
    



    func createNativeView(view _view: UIView,args:String){

//        _view.backgroundColor = UIColor.blue
//        let nativeLabel = UILabel()
//        nativeLabel.text = args?["key"] as? String
//        nativeLabel.textColor = UIColor.white
//        nativeLabel.textAlignment = .center
//        nativeLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 48.0)
//        _view.addSubview(nativeLabel)
        let webview = WKWebView(frame: UIScreen.main.bounds)
        webview.navigationDelegate = self
        let url: URL! = URL(string:args)
        webview.load(URLRequest(url: url))
        _view.addSubview(webview)
    }
    
}


