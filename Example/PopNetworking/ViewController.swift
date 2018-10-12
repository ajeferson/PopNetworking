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
  let postService = PostService()

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
//    let createPost = Post(title: "Some", body: "Post")
//    postService.create(post: createPost)

    postService.fetchPosts()
//    postService.fetchPost(id: 5)
    
//    let updatePost = Post(id: 5, title: "Foo", body: "Bar")
//    postService.update(updatePost)
    
//    postService.delete(5)
  }
}

