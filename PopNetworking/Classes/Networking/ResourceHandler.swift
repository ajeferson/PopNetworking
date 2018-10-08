//
//  PopNetworking.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

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

/// A class which contains the basic methods and properties
/// for handling networking operations over an object
public protocol ResourceHandler: class {
  /// The type that's associated with this handler
  /// (e.g. Car can be used for fetching, creating, updating car objects)
  associatedtype ResourceType: Resource
  
  /// The class that's responsible for providing urls for the record
  var router: Router { get }
}

public extension ResourceHandler {
  var router: Router {
    let baseURL = PopNetworkingConfig.shared.baseURL
    return DefaultRouter<ResourceType>(baseURL: baseURL)
  }
}

private extension ResourceHandler {
  /// The root key of a response body
  ///
  /// - Parameter decodeOptions: The way of decoding the response body
  func rootKey(for decodeOptions: DecodeOptions) -> RootKey {
    switch decodeOptions {
    case .none: return RootKey.none
    case .collectionKey: return RootKey.key(ResourceType.name.pluralized())
    case .memberKey: return RootKey.key(ResourceType.name)
    case .key(let value): return RootKey.key(value)
    }
  }
}

// TODO Refactor this
extension ResourceHandler {
  static var jsonHeaders: [String: String] {
    return [
      "Content-Type": "application/json"
    ]
  }
}

extension ResourceHandler {
  /// Performs a HTTP request
  ///
  /// - Parameters:
  ///   - url: The to url of the request
  ///   - method: The HTTP method of the request (e.g. get, post)
  ///   - encoding: How parameters should be encoded
  ///   - headers: The headers to send on the request
  ///   - options: How to decode the response body
  ///   - onSuccess: Code to execute after a succeeded request
  ///   - onError: Code to execute after a failed request
  func request(url: String,
               method: HTTPMethod = .get,
               parameters: Parameters? = nil,
               encoding: ParameterEncoding = URLEncoding.default,
               headers: HTTPHeaders? = nil,
               options: DecodeOptions,
               onSuccess: @escaping (Data) -> Void,
               onError: @escaping (Error) -> Void) -> Request {
    return Alamofire
      .request(url,
               method: method,
               parameters: parameters,
               encoding: encoding,
               headers: headers)
      .responseData(completionHandler: { response in
        switch response.result {
        case .success(let value):
          onSuccess(value)
        case .failure:
          onError(response.isNetworkError ? PopError.network : PopError.unknown)
        }
      })
  }
  
  /// A reactive wrapper for HTTP requests
  ///
  /// - Parameters:
  ///   - url: The to url of the request
  ///   - method: The HTTP method of the request (e.g. get, post)
  ///   - encoding: How parameters should be encoded
  ///   - headers: The headers to send on the request
  ///   - options: How to decode the response body
  ///   - onSuccess: Code to execute after a succeeded request
  ///   - onError: Code to execute after a failed request
  func requestData(url: String,
                   method: HTTPMethod = .get,
                   parameters: Parameters? = nil,
                   encoding: ParameterEncoding = URLEncoding.default,
                   headers: HTTPHeaders? = nil,
                   options: DecodeOptions) -> Observable<Data> {
    return Observable.create { observable in
      let request = self.request(
        url: url,
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: headers,
        options: options,
        onSuccess: { data in
          observable.onNext(data)
          observable.onCompleted()
      }, onError: { error in
        observable.onError(error)
      })
      
      return Disposables.create {
        request.cancel()
      }
    }
  }
  
  /// A reactive wrapper that maps a HTTP request to Resource objects
  ///
  /// - Parameters:
  ///   - url: The to url of the request
  ///   - method: The HTTP method of the request (e.g. get, post)
  ///   - encoding: How parameters should be encoded
  ///   - headers: The headers to send on the request
  ///   - options: How to decode the response body
  ///   - onSuccess: Code to execute after a succeeded request
  ///   - onError: Code to execute after a failed request
  func requestResource<T: Codable>(url: String,
                                method: HTTPMethod = .get,
                                parameters: Parameters? = nil,
                                encoding: ParameterEncoding = URLEncoding.default,
                                headers: HTTPHeaders? = nil,
                                options: DecodeOptions) -> Observable<T> {
    return requestData(url: url,
                       method: method,
                       parameters: parameters,
                       encoding: encoding,
                       headers: headers,
                       options: options)
      .map { [weak self] data -> T in
        guard let strongSelf = self else {
          throw PopError.unknown
        }
        let decoder = JSONDecoder()
        let results: T?
        
        switch strongSelf.rootKey(for: options) {
        case .none:
          results = try? decoder.decode(T.self, from: data)
        case .key(let keyPath):
          results = (try? decoder.decode([String: T].self, from: data))?[keyPath]
        }
        
        guard let resource = results else {
          throw PopError.decode
        }
        return resource
    }
  }
}
