//
//  Poster.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 09/05/2018.
//

import Foundation
import Alamofire
import RxSwift

/// Handles creation of resources
public protocol Creator: ResourceHandler {
  /// Creates a resource on server
  /// - Parameter resource: The resource to create
  /// - Parameter options: The options used for decoding response
  func create(_ resource: ResourceType, options: DecodeOptions) -> Observable<ResourceType>
}

extension Creator {
  public func create(_ resource: ResourceType, options: DecodeOptions = .memberKey) -> Observable<ResourceType> {
    do {
      let data = try JSONEncoder().encode(resource)
      let encoding = CustomDataEncoding(data: data)
      return requestResource(url: router.index,
                             method: .post,
                             parameters: nil,
                             encoding: encoding,
                             headers: Self.jsonHeaders,
                             options: DecodeOptions.memberKey)
    } catch {
      return .error(error)
    }
  }
}

// TODO Refactor this
struct CustomDataEncoding: ParameterEncoding {
  let data: Data

  func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
    var request = try URLEncoding().encode(urlRequest, with: parameters)
    request.httpBody = data
    return request
  }
}
