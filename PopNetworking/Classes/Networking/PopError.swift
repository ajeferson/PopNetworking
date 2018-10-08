//
//  PopError.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation

/// Represents all errors that can occur with this library
public enum PopError: String, Error {
  /// Failure due to internet connection
  case network = "Check your internet connection"
  
  /// Failure due to inability of parsing a JSON body
  case decode = "Could not parse data"
  
  /// Any other error
  case unknown = "An error has occurred, please try again later"
}
