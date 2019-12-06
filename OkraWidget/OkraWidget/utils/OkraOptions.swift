//
//  OkraOptions.swift
//  OkraWidget
//
//  Created by sidomex music studio on 15/10/2019.
//  Copyright © 2019 okra inc. All rights reserved.
//

import Foundation

@objc public class OkraOptions : NSObject {
    @objc var isWebview: Bool
    @objc var key: String
    @objc var token: String
    @objc var products : Array<String>
    @objc var env: String
    @objc var clientName: String
    @objc public init(isWebview: Bool,key: String,token: String,products:Array<String>,env: String,clientName: String) {
        self.isWebview = isWebview
        self.key = key
        self.token = token
        self.products = products
        self.env = env
        self.clientName = clientName
    }
}
