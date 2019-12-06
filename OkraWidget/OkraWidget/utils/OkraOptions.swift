//
//  OkraOptions.swift
//  OkraWidget
//
//  Created by sidomex music studio on 15/10/2019.
//  Copyright © 2019 okra inc. All rights reserved.
//

import Foundation

public class OkraOptions {
    var isWebview: Bool
    var key: String
    var token: String
    var products : Array<String>
    var env: String
    var clientName: String
    public init(isWebview: Bool,key: String,token: String,products:Array<String>,env: String,clientName: String) {
        self.isWebview = isWebview
        self.key = key
        self.token = token
        self.products = products
        self.env = env
        self.clientName = clientName
    }
}
