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
    
    @objc public static func create(baseController : UIViewController, okraOptions: OkraOptions,okraHandlerDelegate:OkraHandlerDelegate ){
        let storyboardBundle = Bundle(for:self)
        let storyBoard : UIStoryboard = UIStoryboard(name: "MainWeb", bundle:storyboardBundle)
        if let pageTwo =  storyBoard.instantiateViewController(withIdentifier: "okraWebView") as? OkraWebView{
            pageTwo.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            pageTwo.okraOptions = okraOptions
            pageTwo.okraHandlerDelegate = okraHandlerDelegate
            pageTwo.baseController = baseController;
            baseController.present(pageTwo, animated:true, completion:nil)
        }
    }
}
