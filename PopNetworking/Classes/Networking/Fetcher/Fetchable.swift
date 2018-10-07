//
//  Fetchable.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 25/04/2018.
//

import Foundation

/// Classes that conform to this protocol
/// gains the ability of being fetched from server
public protocol Fetchable: Resource {
  /// The type of the unique identifier
  associatedtype PrimaryKey
  
  /// The unique identifier of this resource
  var id: PrimaryKey { get }
}
