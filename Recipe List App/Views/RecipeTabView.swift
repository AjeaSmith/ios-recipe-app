//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Ajea Smith on 7/31/22.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabindex = 0
    var body: some View {
        TabView{
            Text("Featured View").tabItem {
                VStack{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            RecipeListView().tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
