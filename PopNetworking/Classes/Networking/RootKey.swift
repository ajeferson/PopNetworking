//
//  RootKey.swift
//  Alamofire
//
//  Created by Alan Jeferson on 10/7/18.
//

import Foundation

/// Represents the root key from a json's response body
enum RootKey {
  /// No key
  case none
  
  /// Type of resource that uses the associated values
  /// as the response body's root key
  /// {
  ///     "key": {
  ///         "id": 1,
  ///         "title": "Nice Post"
  ///     }
  /// }
  case key(String)
}
