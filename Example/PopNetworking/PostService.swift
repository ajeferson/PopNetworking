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
    fetchList()
      .subscribeOn(Schedulers.io)
      .observeOn(Schedulers.main)
      .subscribe(onNext: { posts in
        posts.forEach {
          print($0)
        }
      })
      .disposed(by: bag)
  }
  
  func fetchPost(id: Int) {
    fetchOne(id)
      .subscribeOn(Schedulers.io)
      .observeOn(Schedulers.main)
      .subscribe(onNext: { post in
        print(post)
      })
      .disposed(by: bag)
  }
  
  func create(post: Post) {
    create(post)
      .subscribeOn(Schedulers.io)
      .observeOn(Schedulers.main)
      .subscribe()
      .disposed(by: bag)
  }
  
  func update(_ post: Post) {
    update(post)
      .subscribeOn(Schedulers.io)
      .observeOn(Schedulers.main)
      .subscribe(onNext: { post in
        print(post)
      })
      .disposed(by: bag)
  }
  
  func delete(_ id: Int) {
    delete(id)
      .subscribeOn(Schedulers.io)
      .observeOn(Schedulers.main)
      .subscribe(onNext: { _ in
        print("Deleted!")
      })
      .disposed(by: bag)
  }
}
