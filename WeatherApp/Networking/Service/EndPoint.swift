//
//  EndPoint.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:String]

protocol EndPoint{
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var params: Parameters { get }
}

