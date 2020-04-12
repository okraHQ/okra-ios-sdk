//
//  OkraHandler.swift
//  OkraWidget
//
//  Created by Oto-obong Bassey Eshiett on 12/04/2020.
//  Copyright © 2020 okra inc. All rights reserved.
//

import Foundation
@objc final  class OkraHandler : NSObject {
    private override init() {}
    @objc static var isDone: Bool = false
    @objc static var hasError: Bool = false
    @objc static var isSuccessful: Bool = false
    @objc  static var data: String = ""
}

