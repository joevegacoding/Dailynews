//
//  Newtwork.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-21.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchNews(completion: @escaping ([Articles], Error?) -> ()) {
        
        print("Fetching news")
    let urlString = "https://newsapi.org/v2/top-headlines?country=ca&apiKey=b25bdac4efc7487db7269d73120e13b9"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch data: ", error)
                completion([], nil)
                return
            }
   
            guard let data = data else { return }

            do {
                let articleResults = try JSONDecoder().decode(ArticlesResults.self, from: data)

                completion(articleResults.articles, nil)
            print(articleResults)

            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion([], jsonError)
            }
        }.resume() //does the request
    }

}

