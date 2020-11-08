//
//  ForecastViewControllerInterface.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

protocol ForecastViewControllerInterface: class {
    func showWeatherForecast(weather: Weather)
    func showError(error: String)
}
