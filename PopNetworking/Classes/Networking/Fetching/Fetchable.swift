//
//  Fetchable.swift
//  Alamofire
//
//  Created by Alan Jeferson on 25/04/2018.
//

import Foundation

public protocol Fetchable: Codable {
    
    associatedtype PrimaryKey
    
    var id: PrimaryKey { get }
    
}
