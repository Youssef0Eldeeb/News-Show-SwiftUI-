//
//  HomeViewModel.swift
//  News Show
//
//  Created by Youssef Eldeeb on 30/09/2023.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject{
    @Published var newsResult: [Article] = []
    @Published var newsCategoryResult: [Article] = []
    
    func getTopHeadlinesNews(category: Category?){
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


