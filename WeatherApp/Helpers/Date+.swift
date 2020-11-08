//
//  Date+.swift
//  WeatherApp
//
//  Created by Jeff Tabios on 9/12/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

extension Date {
    func getDay() -> String {
        let components = Calendar.current.dateComponents([.day], from: self)
        return "\(components.day ?? 0)"
    }

    func getMonth() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMM")
        return df.string(from: self)

    }
    
    func getHour() -> String {
        let df = DateFormatter()
        df.dateFormat = "hha"
        return df.string(from: self)
    }
}
