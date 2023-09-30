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
    
        func loadNews(){
            Task{
                var urlComponent = URLComponents(string: "https://newsapi.org/v2/top-headlines")
                urlComponent?.queryItems = [
                    "country": "us",
                    "category":"business",
                    "apiKey" : "\(apiKey)",
                ].map({
                    URLQueryItem(name: $0.key, value: $0.value)
                })
                do{
                    let (data, response) = try await URLSession.shared.data(from: (urlComponent?.url)!)
                    guard let httpRespnse = response as? HTTPURLResponse, httpRespnse.statusCode == 200 else{
                        return
                    }
                    print(data)
                    let newsResults = try JSONDecoder().decode(NewsResponse.self, from: data)
                    print(newsResults.articles.count)
                    self.newsResult = newsResults.articles

                }catch{
                    print(error)
                }
            }
        }
    
//    func loadNews(){
//
//        var urlComponent = URLComponents(string: "https://newsapi.org/v2/top-headlines")
//        urlComponent?.queryItems = [
//            "country": "us",
//            "category":"business",
//            "apiKey" : "\(apiKey)",
//        ].map({
//            URLQueryItem(name: $0.key, value: $0.value)
//        })
//
//        let task = URLSession.shared.dataTask(with: (urlComponent?.url)!) { data, _, error in
//            guard let data = data , error == nil else{return}
//            do {
//                let newsResults = try JSONDecoder().decode(NewsResponse.self, from: data)
//                DispatchQueue.main.async {
//                    self.newsResult = newsResults.articles
//                }
//            } catch  {
//                print(error)
//            }
//        }
//        task.resume()
//
//    }
    
    
}

