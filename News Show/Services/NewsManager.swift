//
//  NewsManager.swift
//  News Show
//
//  Created by Youssef Eldeeb on 11/09/2023.
//

import Foundation
//import Combine
//
//
//enum APIServiceError: Error {
//    case responseError
//    case parseError(Error)
//}
//
//protocol APIRequestType {
//    associatedtype Response: Decodable
//
//    var path: String { get }
//    var queryItems: [URLQueryItem]? { get }
//}
//
//protocol APIServiceType {
//    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
//}
//
//final class APIService: APIServiceType {
//
//    private let baseURL: URL
//    init(baseURL: URL = URL(string: "https://api.github.com")!) {
//        self.baseURL = baseURL
//    }
//
//    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
//
//        let pathURL = URL(string: request.path, relativeTo: baseURL)!
//
//        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
//        urlComponents.queryItems = request.queryItems
//        var request = URLRequest(url: urlComponents.url!)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let decorder = JSONDecoder()
//        decorder.keyDecodingStrategy = .convertFromSnakeCase
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map { data, urlResponse in data }
//            .mapError { _ in APIServiceError.responseError }
//            .decode(type: Request.Response.self, decoder: decorder)
//            .mapError(APIServiceError.parseError)
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
//    }
//}


class ApiCaller{
    func fetchData(){
        // Create the URL object
        if let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-09-13&to=2023-09-13&sortBy=popularity&apiKey=0d9eff2ac1a94cfb94163017ea7a5d87") {
            // Create the URLSession
            let session = URLSession.shared
            
            // Create the data task
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    // Request successful, process the data
                    if let data = data {
                        do {
                            // Convert the data to JSON
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            
                            // Process the JSON data as needed
                            print(json)
                        } catch {
                            print("Error converting data to JSON: \(error)")
                        }
                    }
                } else {
                    print("HTTP response status code: \(httpResponse.statusCode)")
                }
            }
            
            // Start the task
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
}
