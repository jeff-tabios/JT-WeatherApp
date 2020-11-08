//
//  ForecastDelegate.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

protocol ForecastDelegate: class {
    func didSetSource(source: Source)
    func didSetCity(_ name: TargetCity)
    func didGetForecast()
}
