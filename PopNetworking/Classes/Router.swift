//
//  Routing.swift
//  Alamofire
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation

public protocol Router {
    
    var model: String { get }
    
    var baseUrl: String { get }
    
    var index: String { get }
    
}

// TODO Pluralize
extension Router {
    
    var index: String {
        return "\(baseUrl)/\(model)s"
    }
    
}

struct DefaultRouter: Router {

    let model: String
    let baseUrl: String
    
    init(baseUrl: String, model: String) {
        self.model = model
        self.baseUrl = baseUrl
    }
    
}
