//
//  APIServiceTests.swift
//  WeatherAppTests
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import XCTest
@testable import WeatherApp

class APIServiceTests: XCTestCase {

    func test_APIService(){
        
        //GIVEN
        let sut = APIService()
        let expectation = self.expectation(description: "Forecast")
        var weather: Weather?
        
        //WHEN
        sut.request(endPoint: OpenWeatherAPI.get(q: "munich")) {(result:Result<Weather, APIServiceError>) in
            switch result{
            case .success(let response):
                weather = response
            case .failure(let error):
                print(error)
                break
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        //THEN
        XCTAssertNotNil(weather)
    }

    func test_APIServiceMock(){
        
        //GIVEN
        let sut = APIService(session: URLSessionMock())
        
        var weather: Weather?
        
        //WHEN
        sut.request(endPoint: OpenWeatherAPI.get(q: "munich")) {(result:Result<Weather, APIServiceError>) in
            switch result{
            case .success(let response):
                weather = response
            case .failure:
                break
            }
        }
        
        //THEN
        XCTAssertNotNil(weather)
    }
    
}
