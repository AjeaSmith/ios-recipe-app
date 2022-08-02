//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/30/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var servingSize = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                Image(recipe.image).resizable().scaledToFill()
                
                Text(recipe.name).bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        Text("Select your serving size:")
                        Picker("", selection: $servingSize) {
                            Text("2").tag(2)
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8)
                        }.pickerStyle(SegmentedPickerStyle())
                            .frame(width: 160)
                    }
                    
                    
                    Text("Ingredients").font(.headline).padding([.bottom, .top], 5)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("• " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: servingSize) + " " +  item.name.lowercased())
                    }
                }.padding(.horizontal)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Directions").font(.headline).padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text("\(String(index+1)). \(recipe.directions[index])").padding(.bottom, 5)
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
