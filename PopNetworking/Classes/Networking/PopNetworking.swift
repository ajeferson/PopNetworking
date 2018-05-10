//
//  PopNetworking.swift
//  Nimble
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

public protocol PopNetworking {
    
    associatedtype Model: Codable
    
    var baseUrl: String { get }
    
    var router: Router { get }
    
}

public extension PopNetworking {
    
    var modelName: String {
        let name = String(describing: type(of: Model.self)).components(separatedBy: ".").first?.lowercased()
        return name!
    }
    
    // TODO
    var pluralizedModelName: String {
        let name = String(describing: type(of: Model.self)).components(separatedBy: ".").first?.lowercased()
        return "\(name!)s"
    }
    
    var router: Router {
        return DefaultRouter(baseUrl: baseUrl, model: modelName)
    }
    
}

extension PopNetworking {
    
    func rootKey(for decodeOptions: DecodeOptions) -> RootKey {
        switch decodeOptions {
        case .none: return RootKey.none
        case .collectionKey: return RootKey.key(pluralizedModelName)
        case .memberKey: return RootKey.key(modelName)
        case .key(let value): return RootKey.key(value)
        }
    }
    
}

extension PopNetworking {
    
    static var jsonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
}

extension PopNetworking {
    
    func rawRequest<T: Codable>(url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, options: DecodeOptions, onSuccess: @escaping (T) -> Void, onError: @escaping (Error) -> Void) -> Request {
        
        return Alamofire
            .request(url,
                     method: method,
                     parameters: parameters,
                     encoding: encoding,
                     headers: headers)
            .responseData(completionHandler: { response in
                
                switch response.result {
                case .success(let value):
                    
                    let decoder = JSONDecoder()
                    
                    let results: T?
                    switch self.rootKey(for: options) {
                    case .none:
                        results = try? decoder.decode(T.self, from: value)
                    case .key(let keyPath):
                        results = (try? decoder.decode([String: T].self, from: value))?[keyPath]
                    }
                    
                    guard let data = results else {
                        onError(PopError.decode)
                        return
                    }
                    
                    onSuccess(data)
                    
                case .failure:
                    onError(response.isNetworkError ? PopError.network : PopError.unknown)
                }
                
            })
        
    }
    
    func rxRequest<T: Codable>(url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, options: DecodeOptions) -> Observable<T> {
        
        return Observable.create { observable in
            
            let request = self.rawRequest(
                url: url,
                method: method,
                parameters: parameters,
                encoding: encoding,
                headers: headers,
                options: options,
                onSuccess: { results in
                    observable.onNext(results)
            }, onError: { error in
                observable.onError(error)
            })
            
            return Disposables.create {
                request.cancel()
            }
            
        }
        
    }
    
}
