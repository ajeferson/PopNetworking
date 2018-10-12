//
//  Post.swift
//  PopNetworking_Example
//
//  Created by Alan Jeferson on 10/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import PopNetworking

struct Post: Resource {
  typealias PrimaryKey = Int
  
  var id: Int
  var title: String
  var body: String
}

extension Post {
  init(title: String, body: String) {
    self.id = 0
    self.title = title
    self.body = body
  }
}
