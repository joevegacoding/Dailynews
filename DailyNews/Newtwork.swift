//
//  Newtwork.swift
//  DailyNews
//
//  Created by Joseph Bouhanef on 2020-11-21.
//

import Foundation

class Service {
    static let shared = Service()
    
    
    func fetchNews(searchTerm: String, completion: @escaping ([Articles], Error?) -> ()) {
        let currentDate = Date()
       let formatter = DateFormatter()
    
       formatter.timeStyle = .none
       formatter.dateStyle = .medium
       formatter.dateFormat = "YYYY-MM-dd"
       let dateTimeString = formatter.string(from: currentDate)
       
        
        print("Fetching news")
    let urlString = "https://newsapi.org/v2/everything?q=\(searchTerm)&from=\(dateTimeString)&sortBy=popularity&apiKey=b25bdac4efc7487db7269d73120e13b9"

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
