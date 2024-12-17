//
//  NewsVM.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

class NewsVM{
    
    var networkManager = NetworkManager.sharedInstance
    var news: [Articles]?
    var onDataChange: (() -> Void)?
    
    func getNewsData(){
        Task{
            do{
                let data : News = try await networkManager.fetchData(from: ServerURLs.newsURL)
                self.news = data.articles
                onDataChange?()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func getNewsCount()-> Int{
        return news?.count ?? 0
    }
}
