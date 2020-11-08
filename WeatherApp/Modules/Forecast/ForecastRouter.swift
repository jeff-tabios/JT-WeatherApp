//
//  ForecastRouter.swift
//  WeatherApp
//
//  Created by Jeff Tabios on 9/11/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation
import UIKit

class ForecastRouter {
    func createModule() -> ForecastViewController {
        let viewController = ForecastViewController()
        let presenter = ForecastPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
