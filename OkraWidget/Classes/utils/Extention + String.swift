//
//  Extention + String.swift
//  OkraWidget
//
//  Created by USER on 01/02/2021.
//

import Foundation


extension String {
    
   public func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
