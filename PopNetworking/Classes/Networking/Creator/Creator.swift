//
//  Poster.swift
//  Alamofire
//
//  Created by Alan Jeferson on 09/05/2018.
//

import Foundation
import Alamofire
import RxSwift

public protocol Creator: PopNetworking {
    func create(_ model: Model, options: DecodeOptions) -> Observable<Model>
}

extension Creator {
     
    public func create(_ model: Model, options: DecodeOptions = .memberKey) -> Observable<Model> {
        let data = try! JSONEncoder().encode(model)
        let encoding = CustomDataEncoding(data: data)
        return rxRequest(url: router.index, method: .post, parameters: nil, encoding: encoding, headers: Self.jsonHeaders, options: DecodeOptions.memberKey)
    }
    
}

struct CustomDataEncoding: ParameterEncoding {
    
    let data: Data
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try! URLEncoding().encode(urlRequest, with: parameters)
        request.httpBody = data
        return request
    }
    
}
