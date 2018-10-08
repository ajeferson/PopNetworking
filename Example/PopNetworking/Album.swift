//
//  Album.swift
//  PopNetworking_Example
//
//  Created by Alan Jeferson on 23/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import PopNetworking

struct Album: Resource {
  typealias PrimaryKey = Int
  
  let id: Int
  let title: String
  let description: String?
  let artist: String
  let duration: Int
}

extension Album {
  init(id: Int) {
    self.init(id: id, title: "", description: nil, artist: "", duration: 0)
  }
}
