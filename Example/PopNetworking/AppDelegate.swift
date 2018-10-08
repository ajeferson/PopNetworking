//
//  AppDelegate.swift
//  PopNetworking
//
//  Created by ajeferson on 04/23/2018.
//  Copyright (c) 2018 ajeferson. All rights reserved.
//

import UIKit
import PopNetworking

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    PopNetworkingConfig.shared.baseURL = "http://192.168.0.14:3000"
    return true
  }
}

