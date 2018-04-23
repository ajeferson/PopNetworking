//
//  Fetchabel.swift
//  Alamofire
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import RxSwift

public protocol Fetchable: PopNetworking {
    
    func fetchList() -> Observable<ModelList>
    
}

public extension Fetchable {
    
    func fetchList() -> Observable<ModelList> {
        return rxRequest(url: router.index)
    }
    
}
