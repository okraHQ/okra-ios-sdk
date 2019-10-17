//
//  Okra.swift
//  OkraWidget
//
//  Created by sidomex music studio on 15/10/2019.
//  Copyright © 2019 okra inc. All rights reserved.
//

import Foundation

import UIKit

public class Okra {
    
    init() {}
    
    public static func create(baseController : UIViewController, okraOptions: OkraOptions ){
        let storyboardBundle = Bundle(for:self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:storyboardBundle)
        if let pageTwo =  storyBoard.instantiateViewController(withIdentifier: "okraWebView") as? OkraWebView{
            pageTwo.okraOptions = okraOptions
            pageTwo.baseController = baseController;
            baseController.present(pageTwo, animated:true, completion:nil)
        }
    }
}