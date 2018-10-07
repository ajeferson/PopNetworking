//
//  DecodeOptions.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 25/04/2018.
//

import Foundation

/// This type represents the different types
/// of response body structure.
public enum DecodeOptions {
  /// This is for response bodies with no root key
  /// As an example, imagine an enpoints that returns
  /// a list of posts in the following format:
  /// [
  ///    {
  ///       "id": 1,
  ///       "title": "Nice Post"
  ///     }, {
  /// [
  ///    {
  ///       "id": 2,
  ///       "title": "Another nice Post"
  ///     }
  /// ]
  case none
  
  /// Type of decoding that uses the pluralized resource name
  /// as the response body's root key
  /// {
  ///     "posts": [
  ///       {
  ///           "id": 1,
  ///           "title": "Nice Post"
  ///       }, {
  ///       {
  ///           "id": 2,
  ///          "title": "Another nice Post"
  ///       }
  ///     ]
  /// }
  case collectionKey
  
  /// Type of resource that uses the singular resource name
  /// as the response body's root key
  /// {
  ///     "post": {
  ///         "id": 1,
  ///         "title": "Nice Post"
  ///     }
  /// }
  case memberKey
  
  /// Type of resource that uses the associated values
  /// as the response body's root key
  /// {
  ///     "some": {
  ///         "id": 1,
  ///         "title": "Nice Post"
  ///     }
  /// }
  case key(String)
}
