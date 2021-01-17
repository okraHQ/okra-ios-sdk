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
    
    public var okraHandlerDelegate:OkraHandlerDelegate!
    
    var linkOptions = [String: String]()
    

    
    
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
            
            let dataString = message.body as! String
            let dataDictionary = convertToDictionary(text: dataString)
            okraHandlerDelegate.onSuccess(data: dataDictionary ?? [:])
            
        }else if(message.name == "jsErrorMessageHandler"){
        
            let dataString = message.body as! String
            let dataDictionary = convertToDictionary(text: dataString)
            okraHandlerDelegate.onError(data: dataDictionary ?? [:])
        }else if(message.name == "jsCloseMessageHandler"){

            okraHandlerDelegate.onClose()
        }
        switchToPreviousPage();
    }
    
    func switchToPreviousPage(){
        self.dismiss(animated: true, completion: nil)
    }
    
  
}


func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}
