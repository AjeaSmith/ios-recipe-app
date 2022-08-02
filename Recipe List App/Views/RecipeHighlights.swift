//
//  RecipeHighlights.swift
//  Recipe List App
//
//  Created by Ajea Smith on 8/2/22.
//

import SwiftUI

struct RecipeHighlights: View {
    var allhighlights = ""
    
    init(highlights: [String]){
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allhighlights += highlights[index]
            }else{
                allhighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allhighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2"])
    }
}
