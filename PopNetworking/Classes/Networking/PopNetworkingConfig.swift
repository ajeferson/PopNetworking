//
//  PopNetworkingConfig.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 10/7/18.
//

import Foundation

/// Base configuration for this library
public final class PopNetworkingConfig {
  /// Singleton instance
  public static let shared = PopNetworkingConfig()

  /// The base URL that's used by ResourceHandler protocols
  public var baseURL = "http://localhost"

  private init() {}
}
