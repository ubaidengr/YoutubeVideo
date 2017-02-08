//
//  NetworkProtocol.swift
//  SwiftTest
//
//  Created by Muhammad Ubaid on 1/11/17.
//  Copyright © 2017 Muhammad Ubaid. All rights reserved.
//

import UIKit

protocol NetworkProtocol: class {
    
    func playlistDownloadedSuccess(returnObject: Array<AnyObject>) -> Void
    func playlistDownloadedFailed(reason: String) -> Void
}
