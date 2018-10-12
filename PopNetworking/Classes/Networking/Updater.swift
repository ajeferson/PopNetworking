//
//  Updater.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 09/05/2018.
//

import Foundation
import RxSwift

/// Handles the update of resources
public protocol Updater: ResourceHandler {
  /// Updates a resource the given resource
  ///
  /// - Parameter resource: The resource to update
  func update(_ resource: ResourceType) -> Observable<ResourceType>
}

public extension Updater {
  func update(_ resource: ResourceType) -> Observable<ResourceType> {
    do {
      let data = try JSONEncoder().encode(resource.params())
      let encoding = CustomDataEncoding(data: data)
      return requestResource(url: router.show(resource.id),
                             method: .patch,
                             parameters: nil,
                             encoding: encoding,
                             headers: Self.jsonHeaders)
    } catch {
      return .error(error)
    }
  }
}
