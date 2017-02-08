//
//  VideosManager.swift
//  SwiftTest
//
//  Created by Muhammad Ubaid on 1/11/17.
//  Copyright © 2017 Muhammad Ubaid. All rights reserved.
//

import UIKit

class VideosManager: NSObject, NetworkProtocol {

    weak var delegate: VideosManagerProtocol?
    let network = NetworkManager()
    
    func getPlaylist() {
        
        network.delegate = self;
        network.getPlayList(playlistId: "PLVsGWf1GF2vpK_zRalKzcs7eDgT9ZU5v3", channel: nil)
    }
    
    func playlistDownloadedSuccess(returnObject: Array<AnyObject>) {
        debugPrint(returnObject)
        var playlistArray: [PlaylistObject] = []
        for i in 0 ..< returnObject.count {
            let playlistObject = returnObject[i]
            let playlist: PlaylistObject = PlaylistObject()
            let snippet = playlistObject["snippet"] as? [String: AnyObject]
            let thumbnails = snippet?["thumbnails"] as? [String: AnyObject]
            let defaultImg = thumbnails?["default"] as? [String: AnyObject]
            let defaultImgUrl = defaultImg?["url"] as? String
            let videoId = ((snippet?["resourceId"] as? [String: AnyObject])? ["videoId"] as? String)
            playlist.title = snippet?["title"] as? String
            playlist.imgUrl = defaultImgUrl
            playlist.videoID = videoId
            
            playlistArray.append(playlist)
        }
        self.delegate?.videosManagerDownloadedSuccess(returnObject: playlistArray)
    }
    
    func playlistDownloadedFailed(reason: String) {
        self.delegate?.videosManagerDownloadedFailed(reason: reason)
    }
}
