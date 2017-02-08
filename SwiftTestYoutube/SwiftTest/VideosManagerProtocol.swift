//
//  VideosManagerProtocol.swift
//  SwiftTest
//
//  Created by Muhammad Ubaid on 1/12/17.
//  Copyright © 2017 Muhammad Ubaid. All rights reserved.
//

import UIKit

protocol VideosManagerProtocol: class {

    func videosManagerDownloadedSuccess(returnObject: Array<AnyObject>) -> Void
    func videosManagerDownloadedFailed(reason: String) -> Void
}
