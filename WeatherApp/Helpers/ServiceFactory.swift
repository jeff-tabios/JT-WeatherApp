//
//  SourceFactory.swift
//  WeatherApp
//
//  Created by Jeff Tabios on 9/10/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

protocol ServiceFactoryProtocol {
    func createSource(source: Source) -> APIProtocol
}

class ServiceFactory: ServiceFactoryProtocol {
    func createSource(source: Source) -> APIProtocol {
        switch source {
        case .live:
            return APIService()
        case .local:
            return APIService(session: URLSessionMock())
        }
    }
}
