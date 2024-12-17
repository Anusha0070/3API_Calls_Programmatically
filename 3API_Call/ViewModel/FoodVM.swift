//
//  FoodVM.swift
//  3API_Call
//
//  Created by Anusha Raju on 12/16/24.
//

class FoodVM{
    
    var networkManager = NetworkManager.sharedInstance
    
    var food: [Food]?
    var onDataChange: (() -> Void)?
    
    func getFoodData(){
        Task{
            do{
                let data : FoodData = try await networkManager.fetchData(from: ServerURLs.foodURL)
                self.food = data.food_groups
                onDataChange?()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func getFoodGroupCount()-> Int{
        return food?.count ?? 0
    }
    
    func getFoodGroupItems(index: Int) -> [FoodItem]{
        return food?[index].food_items ?? []
    }
    
}
