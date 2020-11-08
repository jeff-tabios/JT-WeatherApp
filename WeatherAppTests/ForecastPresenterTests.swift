//
//  ForecastPresenterTests.swift
//  WeatherAppTests
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import XCTest
@testable import WeatherApp

class ForecastPresenterTests: XCTestCase {
    var presenter: ForecastPresenter?
    var viewController: ViewControllerSpy!
    
    func test_getForecastShouldGetForecast() {
        //GIVEN
        viewController = ViewControllerSpy()
        presenter = ForecastPresenter(view: viewController)

        //WHEN
        presenter?.didSetSource(source: .local)
        presenter?.didSetCity(.munich)
        presenter?.didGetForecast()
        
        //THEN
        XCTAssertNotNil(presenter?.weather)
    }
    
    func test_successfulGetForecastShouldShowWeatherForecast() {
        //GIVEN
        viewController = ViewControllerSpy()
        presenter = ForecastPresenter(view: viewController)
        
        //When
        presenter?.didSetSource(source: .local)
        presenter?.didSetCity(.munich)
        presenter?.didGetForecast()
        
        //THEN
        XCTAssertNotNil(presenter?.weather)
        XCTAssertTrue(viewController!.didCallShowWeatherForecast)
    }
    
    func test_failedGetForecastShouldShowError() {
        //GIVEN
        viewController = ViewControllerSpy()
        presenter = ForecastPresenter(view: viewController)
        
        //When
        presenter?.didSetSource(source: .local)
        presenter?.didSetCity(.none)
        presenter?.didGetForecast()
        
        //THEN
        XCTAssertNil(presenter?.weather)
        XCTAssertTrue(viewController!.didShowError)
    }
}

//Test double (Spy)
class ViewControllerSpy: ForecastViewControllerInterface {
    
    var didCallShowWeatherForecast = false
    var didShowError = false
    
    func showWeatherForecast(weather: Weather) {
        didCallShowWeatherForecast = true
    }
    
    func showError(error: String) {
        didShowError = true
    }
}
