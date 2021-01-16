//
//  ViewController.swift
//  OkraWidget
//
//  Created by boluok on 01/15/2021.
//  Copyright (c) 2021 boluok. All rights reserved.
//

import UIKit
import OkraWidget

class ViewController: UIViewController,OkraHandlerDelegate {
    
    
    
    let launchButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
    }
    
    @objc func showExample(){
        
    let okraOptions = OkraOptions(isWebview: true, key: "key", token: "token", products: ["auth","transactions"], env: Environment.production.rawValue, clientName: "Basey")
        Okra.create(baseController: self, okraOptions : okraOptions, okraHandlerDelegate: self)
        
    }
    
    func onSuccess(data: [String : Any]) {
        print("Succesfully connected bank \(data)")
    }
    
    func onError(data: [String : Any]) {
        print("Error Receieved \(data)")
    }
    
    func onClose() {
        print("Closed")
    }
  
}
