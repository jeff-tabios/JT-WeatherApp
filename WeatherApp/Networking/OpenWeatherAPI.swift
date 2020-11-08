//
//  OpenWeatherAPI.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

enum OpenWeatherAPI {
    case get(q: String)
}

extension OpenWeatherAPI: EndPoint {
    var appId: String { return "18d4b79241d03fe7b20901ab1774e46d" }
    var unit: String { return "metric" }
    
    var baseURL: String {
        return "https://api.openweathermap.org/data/2.5/forecast"
    }
    
    var path: String {
        return ""
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
    
    var params: Parameters {
        var items = Parameters()
        
        switch self {
        case .get(let q):
            items["q"] = q
        }
        
        items["units"] = unit
        items["appid"] = appId
        
        return items
    }
}

