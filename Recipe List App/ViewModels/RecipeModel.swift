//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/30/22.
//

// Methods access data from Data service API
import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init(){
        
        // Create instance of data service to fetch data
        self.recipes = DataService.getLocalData()
    }
}
