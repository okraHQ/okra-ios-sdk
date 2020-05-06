//
//  OkraWebView.swift
//  OkraWidget
//
//  Created by sidomex music studio on 15/10/2019.
//  Copyright © 2019 okra inc. All rights reserved.
//

import Foundation

import UIKit
import WebKit

class OkraWebView: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
    
    public var okraOptions: OkraOptions!
    
    public var baseController : UIViewController?
    
    var linkOptions = [String: String]()
    

    @IBOutlet var web: WKWebView!
    
    override func loadView() {
        super.loadView()
        web.configuration.userContentController.add(self, name: "jsMessageHandler")
        web.configuration.userContentController.add(self, name: "jsErrorMessageHandler")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: formatUrl())
        web.load(request)
        web.navigationDelegate = self
        web.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
    }
    
    func webView(_ webView: WKWebView, didFinish  navigation: WKNavigation!)
    {
        do{
            let okraOptionsEncoded = okraOptions.encode()
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(okraOptionsEncoded)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            web.evaluateJavaScript("openOkraWidget('"+json!+"')", completionHandler: { (object,error) in})
        }catch{}
    }

    // Observe value
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let key = change?[NSKeyValueChangeKey.newKey] {
            switchToPreviousPage();
        }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == "jsMessageHandler") {
            OkraHandler.data = message.body as! String;
            OkraHandler.isSuccessful = true;
            OkraHandler.isDone = true;
            switchToPreviousPage();
        }else if(message.name == "jsErrorMessageHandler"){
            OkraHandler.data = message.body as! String;
            OkraHandler.hasError = true;
            OkraHandler.isDone = true;
            switchToPreviousPage();
        }
    }
    
    func switchToPreviousPage(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func formatUrl() -> URL{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "mobile.okra.ng"
        urlComponents.path = "/"
        return urlComponents.url!;
    }
}

