//
//  ForecastPresenter.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

class ForecastPresenter {
    unowned var view: ForecastViewControllerInterface
    
    private var city: String = ""
    private var source: Source = .live
    var weather: Weather?
    
    init(view: ForecastViewControllerInterface) {
        self.view = view
    }
    
    private func getForecast(completion: @escaping ()-> Void) {
        self.weather = nil
        
        let sourceFactory = Ser1viceFactory()
        let api = sourceFactory.createSource(source: self.source)
        
        api.request(endPoint: OpenWeatherAPI.get(q: self.city)) {(result:Result<Weather, APIServiceError>) in
            switch result{
            case .success(let response):
                self.weather = response
                
            case .failure:
                self.weather = nil
                break
            }
            completion()
        }
    }
}

extension ForecastPresenter: ForecastDelegate {
    func didSetSource(source: Source) {
        self.source = source
    }
    
    func didSetCity(_ name: TargetCity) {
        self.city = name.rawValue
    }
    
    func didGetForecast() {
        getForecast {
            if let weather = self.weather {
                self.view.showWeatherForecast(weather: weather)
            } else {
                let error = self.source == .local ? Constants.localError : Constants.liveError
                self.view.showError(error: error)
            }
        }
    }
}
