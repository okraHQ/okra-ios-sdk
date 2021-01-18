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

        
        let  guarantor:[String:Any] = ["status":true,"message":"hello nurse","number":1]
        let dataDictionary:[String:Any] = ["isWebview":true,
                                           "key":"key",
                                           "token":"token",
                                           "products": ["auth","transactions"],
                                           "env":Environment.production.rawValue,
                                           "clientName":"Basey",
                                           "source":"ios",
                                           "color":"#953ab7",
                                           "limit":"24",
                                           "guarantors":guarantor,
                                           "corporate":false,
                                           "connectMessage":"Which account do you want to connect with?",
                                           "callback_url":"",
                                           "redirect_url":"",
                                           "logo":"https://cdn.okra.ng/images/icon.svg",
                                           "widget_success":"Your account was successfully linked to Okra, Inc",
                                           "widget_failed":"Which account do you want to connect with?",
                                           "currency":"NGN",
                                           "exp":"2021-08-06",
                                           "manual":false,
                                           "success_title":"Successfully connect bank",
                                           "success_message":"You have successfully connected your bank account"
        ]
        
        Okra.create(baseController: self, dataDictionary: dataDictionary, okraHandlerDelegate: self)
        
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
