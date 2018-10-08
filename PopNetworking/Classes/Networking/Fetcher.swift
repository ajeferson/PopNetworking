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
  ///
  /// - Parameter options: Decoding options for the response
  func fetchList(options: DecodeOptions) -> Observable<[ResourceType]>

  /// Fetches a list of resources at the given path
  ///
  /// - Parameter path: The endpoint from where the list will be fetched
  /// - Parameter options: Decoding options for the response
  func fetchList(at path: String, options: DecodeOptions) -> Observable<[ResourceType]>

  /// Fetches a single resource
  ///
  /// - Parameter id: The identifier of resource to fetch
  func fetchOne(_ id: ResourceType.PrimaryKey, options: DecodeOptions) -> Observable<ResourceType>
}

public extension Fetcher {
  func fetchList(options: DecodeOptions = .collectionKey) -> Observable<[ResourceType]> {
    return requestResource(url: router.index, options: options)
  }

  func fetchList(at path: String, options: DecodeOptions = .collectionKey) -> Observable<[ResourceType]> {
    return requestResource(url: router.collection(path: path), options: options)
  }

  func fetchOne(_ id: ResourceType.PrimaryKey, options: DecodeOptions = .memberKey) -> Observable<ResourceType> {
    return requestResource(url: router.show(id), options: options)
  }
}
