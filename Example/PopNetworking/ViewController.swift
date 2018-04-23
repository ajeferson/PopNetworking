//
//  ViewController.swift
//  PopNetworking
//
//  Created by ajeferson on 04/23/2018.
//  Copyright (c) 2018 ajeferson. All rights reserved.
//

import UIKit
import PopNetworking

class ViewController: UIViewController {

    let albumService = AlbumService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        albumService.fetchAlbums()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

