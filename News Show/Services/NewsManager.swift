//
//  NewsManager.swift
//  News Show
//
//  Created by Youssef Eldeeb on 11/09/2023.
//

import Foundation
import Combine


class WebService: ObservableObject{
    @Published var newsResult: [Article] = []
    @Published var newsCategoryResult: [Article] = []
    
    func getTopHeadlinesNews(category: Category?) {
        Task{
            var urlComponent = URLComponents(string: "https://newsapi.org/v2/top-headlines")
            if category == nil {
                urlComponent?.queryItems = [
                    "country": "us",
                    "apiKey" : "\(apiKey)",
                ].map({
                    URLQueryItem(name: $0.key, value: $0.value)
                })
            }else{
                urlComponent?.queryItems = [
                    "country": "us",
                    "category":"\(category?.rawValue ?? "general")",
                    "apiKey" : "\(apiKey)",
                ].map({
                    URLQueryItem(name: $0.key, value: $0.value)
                })
            }
            
            
            do{
                let (data, response) = try await URLSession.shared.data(from: (urlComponent?.url)!)
                guard let httpRespnse = response as? HTTPURLResponse, httpRespnse.statusCode == 200 else{
                    return
                }
                let newsResults = try JSONDecoder().decode(NewsResponse.self, from: data)
                if category == nil{
                    self.newsResult = newsResults.articles
                    return
                }else{
                    self.newsCategoryResult = newsResults.articles
                    print(newsCategoryResult.first!)
                }
                
            }catch{
                print(error)
            }
        }
    }
    
}



class ApiCaller{
    
    var ArticlesArray: [Article] = []
    
    func fetchData(category: Category?) {
        // Create the URL object
        var urlComponent = URLComponents(string: "https://newsapi.org/v2/top-headlines")
        if category == nil {
            urlComponent?.queryItems = [
                "country": "us",
                "apiKey" : "\(apiKey)",
            ].map({
                URLQueryItem(name: $0.key, value: $0.value)
            })
        }else{
            urlComponent?.queryItems = [
                "country": "us",
                "category":"\(category?.rawValue ?? "general")",
                "apiKey" : "\(apiKey)",
            ].map({
                URLQueryItem(name: $0.key, value: $0.value)
            })
        }
            
            
            // Create the data task
        let task = URLSession.shared.dataTask(with: (urlComponent?.url)!) { (data, response, error) in
            
            if let unwrappedData = data {
                //decodeing to coming data
                let jsonDecoder = JSONDecoder()
                if let decodedObject = try? jsonDecoder.decode(NewsResponse.self, from: unwrappedData){
                    self.ArticlesArray = decodedObject.articles
                    
                }
            }
            if let unwrappedError = error {
                let strError = unwrappedError.localizedDescription
                self.ArticlesArray = []
                
            }
            
        }
            
            // Start the task
            task.resume()
    }
}
enum Category: String, CaseIterable{
    case general
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
}
