//
//  VideoDetailViewController.swift
//  YoutubeSham
//
//  Created by Muhammad Ubaid on 1/14/17.
//  Copyright © 2017 Muhammad Ubaid. All rights reserved.
//

import UIKit
import AVKit

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var playerView: YTPlayerView!
    @IBOutlet weak var titleLable: UILabel?
    
    var playlistObj: PlaylistObject?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: @sel)

        if let videoId = playlistObj?.videoID {
            playerView.load(withVideoId: videoId)
        }
        self.titleLable?.text = playlistObj?.title;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
