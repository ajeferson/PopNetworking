//
//  PostService.swift
//  PopNetworking_Example
//
//  Created by Alan Jeferson on 10/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import PopNetworking

class PostService: ResourceManager {
  typealias ResourceType = Post
  
  private let bag = DisposeBag()
  
  func fetchPosts() {
//    fetchOne(5)
//    fetchList()
    delete(4)
      .debug()
      .subscribeOn(Schedulers.io)
      .observeOn(Schedulers.main)
      .subscribe()
      .disposed(by: bag)
  }
}
