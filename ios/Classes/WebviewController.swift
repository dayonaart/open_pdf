//
//  WebviewController.swift
//  open_pdf
//
//  Created by Dayona on 05/08/22.
//

import Foundation
import WebKit

class WebviewController : UIViewController, WKNavigationDelegate{
    override func viewDidLoad() {
        let webview = WKWebView(frame: UIScreen.main.bounds)
        view.addSubview(webview)
        webview.navigationDelegate = self
        webview.load(URLRequest(url: URL(fileURLWithPath: "path")))
    }
}
