//
//  Schedulers.swift
//  PopNetworking
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import RxSwift

public typealias Scheduler = ImmediateSchedulerType

/// Handy struct for RxSwift's Schedulers
public struct Schedulers {
  /// Scheduler that uses a background thread
  public static let io: Scheduler = ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global(qos: .utility))
  
  /// Scheduler that uses main thread
  public static let main: Scheduler = MainScheduler.instance
  
  /// Scheduler that uses current thread
  public static let current: Scheduler = CurrentThreadScheduler.instance
}
