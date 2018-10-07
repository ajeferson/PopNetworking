//
//  Updater.swift
//  Alamofire
//
//  Created by Alan Jeferson on 09/05/2018.
//

import Foundation
import RxSwift

/// Handles the update of resources
public protocol Updater: ResourceHandler where ResourceType: Updatable {
  /// Updates a resource the given resource
  ///
  /// - Parameter resource: The resource to update
  /// - Parameter options: The options used to parse the response body
  func update(_ resource: ResourceType, options: DecodeOptions) -> Observable<ResourceType>
}

public extension Updater {
  func update(_ resource: ResourceType, options: DecodeOptions = .memberKey) -> Observable<ResourceType> {
    do {
      let data = try JSONEncoder().encode(resource)
      let encoding = CustomDataEncoding(data: data)
      return rxRequest(url: router.show(resource.id),
                       method: .patch,
                       parameters: nil,
                       encoding: encoding,
                       headers: Self.jsonHeaders,
                       options: DecodeOptions.memberKey)
    } catch {
      return .error(error)
    }
  }
}
