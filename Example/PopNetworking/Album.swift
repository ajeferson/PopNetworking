//
//  Album.swift
//  PopNetworking_Example
//
//  Created by Alan Jeferson on 23/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct Album: Codable {
    
    // TODO release_date
    let id: Int
    let title: String
    let description: String?
    let artist: String
    let duration: Int
    
}

struct AlbumList: Codable {
    
    let albums: [Album]
    
}
