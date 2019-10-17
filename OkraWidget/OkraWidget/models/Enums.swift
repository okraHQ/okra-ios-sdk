//
//  Enums.swift
//  OkraWidget
//
//  Created by sidomex music studio on 15/10/2019.
//  Copyright © 2019 okra inc. All rights reserved.
//

import Foundation

public enum Environment :String {
    case dev
    case sandbox
    case staging
    case production
    func toString() ->String { return self.rawValue }
}

