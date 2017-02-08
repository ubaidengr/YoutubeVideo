//
//  ViewController.swift
//  SwiftTest
//
//  Created by Muhammad Ubaid on 1/6/17.
//  Copyright © 2017 Muhammad Ubaid. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, VideosManagerProtocol {

    var listItems: [PlaylistObject] = [];
    let videosManager = VideosManager()
    var playlistObj: PlaylistObject?
    
    @IBOutlet var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videosManager.delegate = self
        self.videosManager.getPlaylist()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.playlistObj = listItems[indexPath.row]
        performSegue(withIdentifier: "videodetailsegue", sender: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell;
        
        cell = tableView.dequeueReusableCell(withIdentifier: "identifier")! as! CustomTableViewCell
        let obj = self.listItems[indexPath.row];
        cell.titleLabelText.text = obj.title;
        
        if let url = obj.imgUrl {
            
            Alamofire.request(url).responseImage { response in
                
                if let image = response.result.value {
                    cell.img.image = image
                }
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! VideoDetailViewController
        detail.playlistObj = self.playlistObj
    }
    
    func videosManagerDownloadedSuccess(returnObject: Array<AnyObject>) {
        self.listItems = returnObject as! [PlaylistObject]
        self.table?.reloadData()
    }
    
    func videosManagerDownloadedFailed(reason: String) {
        
    }

}

