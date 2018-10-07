//
//  DataResponseExtension.swift
//  Alamofire
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import Alamofire

public extension DataResponse {
  var isSuccess: Bool {
    return self.response?.statusCode == 200
  }
  
  var isCreated: Bool {
    return self.response?.statusCode == 201
  }
  
  var isNotFound: Bool {
    return self.response?.statusCode == 404
  }
  
  var isUnauthorized: Bool {
    return self.response?.statusCode == 401
  }
  
  var isServerError: Bool {
    return self.response?.statusCode == 500
  }
  
  var isNetworkError: Bool {
    return self.response == nil
  }
}
