//
//  ContentView.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/30/22.
//

// Methods access data from Recipe model
import SwiftUI

struct RecipeListView: View {
    
    // Reference view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView{
            List(model.recipes){ r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                    
                        HStack(spacing: 20.0){
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                })
                
            }.navigationTitle("All Recipes")
            .listStyle(.plain)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
