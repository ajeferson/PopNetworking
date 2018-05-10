//
//  Updater.swift
//  Alamofire
//
//  Created by Alan Jeferson on 09/05/2018.
//

import Foundation
import RxSwift

public protocol Updater: PopNetworking {
    func update<T: Updatable>(_ model: T, options: DecodeOptions) -> Observable<Model>
}

public extension Updater {
    
    func update<T: Updatable>(_ model: T, options: DecodeOptions = .memberKey) -> Observable<Model> {
        let data = try! JSONEncoder().encode(model)
        let encoding = CustomDataEncoding(data: data)
        return rxRequest(url: router.show(model.id), method: .patch, parameters: nil, encoding: encoding, headers: Self.jsonHeaders, options: DecodeOptions.memberKey)
    }
    
}
