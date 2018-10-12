//
//  Routing.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation

/// The class who conforms to this protocol should provide
/// the endpoints that will be used by ResourceHandler classes.
/// Each ResourceHandler should have its own router,
/// so this is "resource-scoped".
public protocol Router {
  /// The base path for the resource
  var resourcePath: String { get }

  /// The index path for the resource
  var index: String { get }

  /// A path for a instance of the resource
  func show(_ id: Any) -> String

  /// A path for a collection of instances of the reource
  func collection(path: String) -> String
}

// TODO Better .json extension handling

/// The default router that's used by default
/// implementation of ResourceHandler classes
/// It uses the same standard as used in Ruby on Rails.
struct DefaultRouter<T: Resource>: Router {
  /// The base url to which paths are appended
  let baseURL: String

  init(baseURL: String) {
    self.baseURL = baseURL
  }

  var resourcePath: String {
    return "\(baseURL)/\(T.name.pluralized())"
  }

  var index: String {
    return "\(resourcePath).json"
  }

  func show(_ id: Any) -> String {
    return "\(resourcePath)/\(id).json"
  }

  func collection(path: String) -> String {
    return "\(resourcePath)/\(path).json"
  }
}
