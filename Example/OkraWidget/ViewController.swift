//
//  ViewController.swift
//  OkraWidget
//
//  Created by boluok on 01/15/2021.
//  Copyright (c) 2021 boluok. All rights reserved.
//

import UIKit
import OkraWidget

class ViewController: UIViewController {
    let launchButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpConstraintsAndProperties()
        showExample()
    }
    
    @objc func showExample(){
        
    let okraOptions = OkraOptions(isWebview: true, key: "fa85e5ce-0e4e-5a88-883d-9ba9b4357683", token: "5da6358130a943486f33dced", products: ["auth","transactions"], env: Environment.production.rawValue, clientName: "Basey")
        Okra.create(baseController: self, okraOptions : okraOptions)
        
    }
  
}
