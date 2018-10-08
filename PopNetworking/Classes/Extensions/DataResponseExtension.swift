//
//  DataResponseExtension.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import Alamofire

/// An handy extension for Alamofire's DataResponse
public extension DataResponse {
  /// Returns true if the response has "success" status code
  var isSuccess: Bool {
    return self.response?.statusCode == 200
  }
  
  /// Returns true if the response has "created" status code
  var isCreated: Bool {
    return self.response?.statusCode == 201
  }
  
  /// Returns true if the response has "not found" status code
  var isNotFound: Bool {
    return self.response?.statusCode == 404
  }
  
  /// Returns true if the response has "unauthorized" status code
  var isUnauthorized: Bool {
    return self.response?.statusCode == 401
  }
  
  /// Returns true if the response has "server error" status code
  var isServerError: Bool {
    return self.response?.statusCode == 500
  }
  
  /// Returns true if the response is a network error
  var isNetworkError: Bool {
    return self.response == nil
  }
}
