//
//  Okra.swift
//  OkraWidget
//
//  Created by sidomex music studio on 15/10/2019.
//  Copyright © 2019 okra inc. All rights reserved.
//

import Foundation

import UIKit

@objc public class Okra :NSObject {
    
    @objc public static func create(baseController : UIViewController, dataDictionary: [String:Any],okraHandlerDelegate:OkraHandlerDelegate ){
        let storyboardBundle = Bundle(for:self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "MainWeb", bundle:storyboardBundle)
        if let pageTwo =  storyBoard.instantiateViewController(withIdentifier: "okraWebView") as? OkraWebView{
            pageTwo.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            pageTwo.dataDictionary = dataDictionary
            pageTwo.okraHandlerDelegate = okraHandlerDelegate
            pageTwo.baseController = baseController;
            baseController.present(pageTwo, animated:true, completion:nil)
        }
    }
}
