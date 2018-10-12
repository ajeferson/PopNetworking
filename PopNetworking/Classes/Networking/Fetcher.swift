//
//  Fetchabel.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import RxSwift

/// Handles the fetching of resources
public protocol Fetcher: ResourceHandler {
  /// Fetches a list of resources
  func fetchList() -> Observable<[ResourceType]>

  /// Fetches a list of resources at the given path
  ///
  /// - Parameter path: The endpoint from where the list will be fetched
  func fetchList(at path: String) -> Observable<[ResourceType]>

  /// Fetches a single resource
  ///
  /// - Parameter id: The identifier of resource to fetch
  func fetchOne(_ id: ResourceType.PrimaryKey) -> Observable<ResourceType>
}

public extension Fetcher {
  func fetchList() -> Observable<[ResourceType]> {
    return requestResource(url: router.index)
  }

  func fetchList(at path: String) -> Observable<[ResourceType]> {
    return requestResource(url: router.collection(path: path))
  }

  func fetchOne(_ id: ResourceType.PrimaryKey) -> Observable<ResourceType> {
    return requestResource(url: router.show(id))
  }
}
