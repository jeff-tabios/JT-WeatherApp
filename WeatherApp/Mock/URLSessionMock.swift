//
//  URLSessionMock.swift
//  Weather
//
//  Created by Jeff Tabios on 9/9/20.
//  Copyright © 2020 Jeff Tabios. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    // Properties that enable us to set exactly what data or error
    // we want our mocked URLSession to return for any request.
    var data: Data?
    var error: Error?
    var response: HTTPURLResponse?
    
    override init() {}
    
    override func dataTask(
        with url: URL,
        completionHandler: @escaping CompletionHandler
        ) -> URLSessionDataTask {
        
        let components = URLComponents(string: url.absoluteString)
        
        guard let jsonFile = components?.queryItems?.first(where: {$0.name == "q"})?.value else {
            error = APIServiceError.none
            return URLSessionDataTaskMock {
                completionHandler(self.data, self.response, self.error)
            }
        }
        
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                response = HTTPURLResponse(url: fileUrl, statusCode: 200, httpVersion: "", headerFields: nil)
            } catch {
                self.error = APIServiceError.noData
            }
        }else{
            error = APIServiceError.fileNotFound
        }
        
        let data = self.data
        let error = self.error
        let response = self.response
        
        return URLSessionDataTaskMock {
            completionHandler(data, response, error)
        }
    }
}
