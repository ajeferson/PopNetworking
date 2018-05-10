//
//  Fetchabel.swift
//  Alamofire
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import RxSwift

public protocol Fetcher: PopNetworking {
    
    func fetchList(options: DecodeOptions) -> Observable<[Model]>
    func fetchList(atPath path: String, options: DecodeOptions) -> Observable<[Model]>
    func fetchOne<M: Fetchable>(_ model: M, options: DecodeOptions) -> Observable<Model>
    
}

public extension Fetcher {
    
    func fetchList(options: DecodeOptions = .collectionKey) -> Observable<[Model]> {
        return rxRequest(url: router.index, options: options)
    }

    func fetchList(atPath path: String, options: DecodeOptions = .collectionKey) -> Observable<[Model]> {
        return rxRequest(url: router.collection(path: path), options: options)
    }
    
    func fetchOne<M: Fetchable>(_ model: M, options: DecodeOptions = .memberKey) -> Observable<Model> {
        return rxRequest(url: router.show(model.id), options: options)
    }
    
}
