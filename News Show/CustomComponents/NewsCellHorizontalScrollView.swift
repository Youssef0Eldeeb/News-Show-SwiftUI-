//
//  NewsCellHorizontalScrollView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 24/08/2023.
//

import SwiftUI

struct CellTemplate: View {
    let cell: NewsCell
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Spacer()
            VStack(alignment: .leading){
                Text("by " + cell.author)
                    .font(.footnote)
                Text(cell.title)
                    .font(.title3)
                    .fontDesign(.serif)
                    .lineLimit(3)
            }
            .foregroundColor(.white)
            .fontWeight(.bold)
            
            Text(cell.description ?? "No description")
                .font(.footnote)
                .foregroundColor(.white)
                .lineLimit(2)
            
        }
        .padding(10)
        .padding(.vertical, 20)
        
    }
}

struct NewsCellHorizontalScrollView: View {
    var cells: [NewsCell]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack{
                ForEach(cells.indices, id: \.self){index in
                    
                    Image(cells[index].image)
                        .frame(width: 330, height: 250)
                        .cornerRadius(10)
                        .overlay(alignment: .center) {
                            CellTemplate(cell: cells[index])
                        }
                }
            }
        }
        .padding(.leading, 15)
        .frame(height: 250)
    }
}

struct NewsCellHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
//        CellTemplate()
        NewsCellHorizontalScrollView(cells: [.init(author: "youssef", title: "Hello to world", description: "Next is another function, if_max_lol(), that is identical to if_max(), except that it adds a single print(\"lol”) statement: I benchmark them on my M1 Apple Pro on an increasing array. Following…", image: "Demo"), .init(author: "youssef", title: "Hello to world", description: "Next is another function, if_max_lol(), that is identical to if_max(), except that it adds a single print(\"lol”) statement: I benchmark them on my M1 Apple Pro on an increasing array. Following…", image: "Demo")])
    }
}
