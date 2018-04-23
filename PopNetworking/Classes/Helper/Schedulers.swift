//
//  Schedulers.swift
//  Alamofire
//
//  Created by Alan Jeferson on 23/04/2018.
//

import Foundation
import RxSwift

public typealias Scheduler = ImmediateSchedulerType

public struct Schedulers {
    
    public static let io: Scheduler = ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global(qos: .utility))
    public static let main: Scheduler = MainScheduler.instance
    public static let current: Scheduler = CurrentThreadScheduler.instance
    
}
