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
    
    public var dataDictionary: [String:Any]!
    
    public var baseController : UIViewController?
    
    public var okraHandlerDelegate:OkraHandlerDelegate!
    
    var linkOptions = [String: String]()
    var isSuccesful = false
    var data:[String:Any] = [:]
    let indicator = UIActivityIndicatorView(style: .gray)
    
    @IBOutlet var web: WKWebView!
    
    override func loadView() {
        super.loadView()
        web.configuration.userContentController.add(self, name: "jsMessageHandler")
        web.configuration.userContentController.add(self, name: "jsErrorMessageHandler")
        web.configuration.userContentController.add(self, name: "jsCloseMessageHandler")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://mobile.okra.ng/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let request = URLRequest(url: url)
        web.load(request)
        web.navigationDelegate = self
        web.addObserver(self, forKeyPath: "URL", options: .new, context: nil)
        setUpActivityIndicator()
    }
    
    func setUpActivityIndicator()  {
        indicator.center = web.center
        indicator.hidesWhenStopped = true
        web.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish  navigation: WKNavigation!)
    {
        indicator.stopAnimating()
        if let theJSONData = try?  JSONSerialization.data(
            withJSONObject: dataDictionary ?? [:],
            options: .sortedKeys
              ),
              let json = String(data: theJSONData,
                                       encoding: String.Encoding.utf8) {
            web.evaluateJavaScript("openOkraWidget('"+json+"')", completionHandler: { (object,error) in})
            }
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if(message.name == "jsMessageHandler") {
            
            let dataString = message.body as! String
            let dataDictionary = convertToDictionary(text: dataString)
            isSuccesful = true
            data = dataDictionary ?? [:]
            
        }else if(message.name == "jsErrorMessageHandler"){
        
            let dataString = message.body as! String
            let dataDictionary = convertToDictionary(text: dataString)
            isSuccesful = false
            data = dataDictionary ?? [:]
        }else if(message.name == "jsCloseMessageHandler"){

            okraHandlerDelegate.onClose()
        }
    }
    
    func switchToPreviousPage(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let key = change?[NSKeyValueChangeKey.newKey] {
            let url = key as? URL
            let shouldClose = url?.valueOf("shouldClose")
            if(shouldClose == "true"){
                if(isSuccesful){
                    okraHandlerDelegate.onSuccess(data: data)
                }else{
                    okraHandlerDelegate.onError(data: data)
                }
                switchToPreviousPage()
            }
        }
    }
    
    func getQueryStringParameter(url: String, param: String) -> String? {
      guard let url = URLComponents(string: url) else { return nil }
      return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
  
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = cleanString(text: text).data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

private func cleanString(text:String) -> String{
    let defaultingString = text.slice(from:"v2_icon\":\"", to: "\",\"png_logo\"") ?? ""
    if((defaultingString.contains("</svg>")) == true){
        let parsed = text.replacingOccurrences(of: defaultingString, with: "")
        return parsed
    }
    return text
}
