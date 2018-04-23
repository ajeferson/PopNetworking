//
//  PopError.swift
//  Alamofire
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation

public enum PopError: String, Error {
    
    case network = "Check your internet connection"
    case unknown = "An error has occurred, please try again later"
    
}
