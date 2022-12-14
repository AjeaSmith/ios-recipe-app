//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/31/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                
                TabView(selection: $tabSelectionIndex){
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured {
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack{
                                    Rectangle().foregroundColor(.white)
                                    
                                    VStack(spacing: 0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name).padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)), radius: 10, x: -5, y: 5)
                        }
                        
                    }
                }.tabViewStyle(.page(indexDisplayMode: .automatic))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation Time:").font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                
                Text("Highlights").font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }.padding([.leading, .bottom])
        }
        .onAppear {
            setFeaturedIndex()
        }
    }
    
    func setFeaturedIndex() {
        let index = model.recipes.firstIndex { recipe -> Bool in
           
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}
