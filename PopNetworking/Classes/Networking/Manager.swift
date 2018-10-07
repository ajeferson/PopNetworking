//
//  Manager.swift
//  Alamofire
//
//  Created by Alan Jeferson on 09/05/2018.
//

import Foundation

/// A handy protocol when needed to have all other
/// ResourceHandler conformers
public protocol Manager: Fetcher, Creator, Updater {}
