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

class OkraWebView: UIViewController, WKScriptMessageHandler {
    
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
        
        linkOptions = [
            "isWebview": String(okraOptions.isWebview),
            "key":okraOptions.key,
            "token":okraOptions.token,
            "source":"ios",
            "products":convertProductArrayToString(productList: okraOptions.products),
            "env": okraOptions.env,
            "clientName":okraOptions.clientName,
            "webhook":"http://requestb.in",
            "baseUrl":"https://demo-dev.okra.ng/link.html"
        ]
        
        
        let request = URLRequest(url: formatUrl(options: linkOptions))
        web.load(request)
        web.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
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
        }else{
            print(message.name)
        }
    }
    
    func switchToPreviousPage(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func convertProductArrayToString(productList: Array<String>) -> String{
        
        var formattedArray = "[";
        
        for (index, name) in productList.enumerated(){
            if(index == (productList.count - 1)){
                formattedArray.append("\"\(name)\"")
            }else{
                formattedArray.append("\"\(name)\",")
            }
        }
        formattedArray.append("]")
        
        return formattedArray;
    }
    
    
    func formatUrl(options: [String: String]) -> URL{
        
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "app.okra.ng"
        //urlComponents.port = 3000
        urlComponents.path = "/"
        urlComponents.queryItems = []
        
        for (_, item) in options.enumerated(){
            if(item.key != "baseUrl"){
                if(item.key != "webhook"){
                    let queryItem = URLQueryItem(name: item.key, value: item.value);
                    urlComponents.queryItems?.append(queryItem)
                }
            }
        }
        return urlComponents.url!;
    }
    
}

