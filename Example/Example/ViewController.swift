//
//  ViewController.swift
//  Example
//
//  Created by Malachy Egbuna on 05/12/2019.
//  Copyright © 2019 Okra. All rights reserved.
//

import UIKit
import OkraWidget

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let okraOptions = OkraOptions(isWebview: true, key: "c81f3e05-7a5c-5727-8d33-1113a3c7a5e4", token: "5d8a35224d8113507c7521ac", products: ["auth","transactions"], env: Environment.sandbox.rawValue, clientName: "Basey")
        Okra.create(baseController: self, okraOptions : okraOptions)
    }


}

