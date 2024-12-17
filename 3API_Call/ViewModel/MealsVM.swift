//
//  MealsVM.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//


class MealsVM{
    
    var networkManager = NetworkManager.sharedInstance
    var meal: [Meal]?
    var onDataChange: (() -> Void)?
    
    func getMealData(){
        Task{
            do{
                let data : Meals = try await networkManager.fetchData(from: ServerURLs.mealsURL)
                self.meal = data.meals
                onDataChange?()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func getMealsCount()-> Int{
        return meal?.count ?? 0
    }
}
