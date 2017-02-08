//
//  NetworkManager.swift
//  SwiftTest
//
//  Created by Muhammad Ubaid on 1/11/17.
//  Copyright © 2017 Muhammad Ubaid. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    
    let baseStr = "https://www.googleapis.com/youtube/v3/"
    var delegate: NetworkProtocol?
    
    func getPlayList(playlistId:NSString, channel channelId: NSString?)
    {
        
        let urlStr = String(format: "%@playlistItems?part=snippet&playlistId=%@&key=%@", baseStr, playlistId, "AIzaSyDWjJGpEEr7Q-v-H0Q7bDx-iNK4HWvDcbw")
        
        Alamofire.request(URL(string: urlStr)!).responseJSON { (response) in
            debugPrint(response.result.value!)
            let value = response.result.value as? [String: AnyObject]
            let objs = value?["items"]
            debugPrint(objs)
            self.delegate?.playlistDownloadedSuccess(returnObject: objs as! Array<AnyObject>)
        }
    }

}
