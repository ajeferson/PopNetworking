//
//  DecodeOptions.swift
//  Alamofire
//
//  Created by Alan Jeferson on 25/04/2018.
//

import Foundation

public enum DecodeOptions {
  case none
  case collectionKey
  case memberKey
  case key(String)
}

public enum RootKey {
  case none
  case key(String)
}
