//
//  String+.swift
//  WeatherApp
//
//  Created by Jeff Tabios on 9/11/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

extension String {
  func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss") -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    guard let date = dateFormatter.date(from: self) else {
      preconditionFailure("Take a look to your format")
    }
    return date
  }
}
