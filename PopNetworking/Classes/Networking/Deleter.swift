//
//  Deleter.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 10/7/18.
//

import Foundation
import Alamofire
import RxSwift

/// Handles the deletion of resources
public protocol Deleter: ResourceHandler {
  /// Deletes a resource
  ///
  /// - Parameter id: Id of the resource to be deleted
  /// - Returns: An Observable that indicates when the operation finishes
  func delete(_ id: ResourceType.PrimaryKey) -> Observable<Void>

  /// Deletes a resource
  ///
  /// - Parameter resource: The resource to be deleted
  /// - Returns: An Observable that indicates when the operation finishes
  func delete(_ resource: ResourceType) -> Observable<Void>
}

public extension Deleter {
  public func delete(_ id: ResourceType.PrimaryKey) -> Observable<Void> {
    let url = router.show(id)
    return requestData(url: url,
                       method: .delete,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: nil,
                       options: .none).map { _ -> Void in }
  }

  public func delete(_ resource: ResourceType) -> Observable<Void> {
    return delete(resource.id)
  }
}
