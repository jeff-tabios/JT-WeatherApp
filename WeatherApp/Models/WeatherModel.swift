//
//  WeatherModel.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - List
struct List: Codable {
    let main: Main
    let weather: [WeatherElement]
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case main, weather
        case dtTxt = "dt_txt"
    }
}

// MARK: - Main
struct Main: Codable {
    let temp, tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let icon: String
}
