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
    associatedtype ModelList: Codable
    
    var baseUrl: String { get }
    
    var router: Router { get }
    
}

public extension PopNetworking {
    
    var router: Router {
        let model = String(describing: type(of: Model.self)).components(separatedBy: ".").first?.lowercased()
        return DefaultRouter(baseUrl: baseUrl, model: model!)
    }
    
}

extension PopNetworking {
    
    func rawRequest<T: Codable>(url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, onSuccess: @escaping (T) -> Void, onError: @escaping (Error) -> Void) -> Request {
        
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
                    do {
                        let results = try decoder.decode(T.self, from: value)
                        onSuccess(results)
                    } catch {
                        onError(PopError.unknown)
                    }
                    
                case .failure:
                    onError(response.isNetworkError ? PopError.network : PopError.unknown)
                }
                
            })
        
    }
    
    func rxRequest<T: Codable>(url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> Observable<T> {
        
        return Observable.create { observable in
            
            let request = self.rawRequest(
                url: url,
                method: method,
                parameters: parameters,
                encoding: encoding,
                headers: headers,
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
