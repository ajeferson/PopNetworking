//
//  Resource.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 10/13/18.
//

import Foundation

/// The Resource is the base type that represents
/// some entity with which the handlers can work with
public protocol Resource: Codable {
  /// The type of the unique identifier
  associatedtype PrimaryKey

  /// The unique identifier of this resource
  var id: PrimaryKey { get }
}

public extension Resource {
  static var name: String {
    let name = String(describing: type(of: self)).components(separatedBy: ".").first?.lowercased()
    return name ?? ""
  }
}
