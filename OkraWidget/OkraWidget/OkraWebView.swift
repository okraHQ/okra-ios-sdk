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
        web.configuration.userContentController.add(self, name: "jsCloseMessageHandler")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: formatUrl())
        web.load(request)
        web.navigationDelegate = self
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

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == "jsMessageHandler") {
              NotificationCenter.default.post(name: Notification.Name(rawValue: "okra.onSuccess"), object: ["data": message.body as! String])
            
            
        }else if(message.name == "jsErrorMessageHandler"){
             NotificationCenter.default.post(name: Notification.Name(rawValue: "okra.onError"), object: ["data": message.body as! String])
            
        }else if(message.name == "jsCloseMessageHandler"){
             NotificationCenter.default.post(name: Notification.Name(rawValue: "okra.onClose"), object: ["data": message.body as! String])
        }
        switchToPreviousPage();
    }
    
    func switchToPreviousPage(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func formatUrl() -> URL{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "v2-mobile.okra.ng"
        urlComponents.path = "/mobile.html"
        return urlComponents.url!
    }
}
