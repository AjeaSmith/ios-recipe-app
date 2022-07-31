//
//  DataServices.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/30/22.
//


// Makes network requests for the data 
import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        // parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }
        
        // create url object
        let urlpath = URL(fileURLWithPath: pathString!)
        
        // create data object
        do {
            let data = try Data(contentsOf: urlpath)
            
            // decode data
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // attach unique IDS to data
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
            } catch {
                print("error json parse", error)
            }
            
            
        } catch {
            print("error: getting data", error)
        }
        return [Recipe]()
    }
}
