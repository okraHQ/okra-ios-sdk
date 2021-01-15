//
//  OkraHandleDelgate.swift
//  OkraWidget
//
//  Created by Bolu Okunaiya on 15/01/2021.
//

import Foundation

protocol OkraHandlerDelegate {
    func onSuccess(data:[String:Any])
    func onError(data:[String:Any])
    func onClose()
}
