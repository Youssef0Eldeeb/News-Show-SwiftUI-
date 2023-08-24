//
//  NewsCellVerticalScrollView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 24/08/2023.
//

import SwiftUI

struct CellVerticalTemplate: View {
    var cellData: NewsCell
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(cellData.title)
                .font(.headline)
                .fontWeight(.bold)
                .fontDesign(.serif)
                .foregroundColor(Color.white)
            HStack {
                Text(cellData.author)
                Spacer()
                Text(cellData.publishedAt ?? "No date")
            }
            .font(.footnote)
            .foregroundColor(Color.white)
            
        }
        .padding(20)
        .padding(.vertical, 20)
        
    }
}



struct NewsCellVerticalScrollView: View {
    let cells: [NewsCell]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack{
                ForEach(cells.indices, id: \.self){index in
                    
                    Image(cells[index].image)
                        .frame(width: 340, height: 120)
                        .cornerRadius(10)
                        .overlay(alignment: .center) {
                            CellVerticalTemplate(cellData: cells[index])
                        }
                }
            }
        }
    }
}

struct NewsCellVerticalScrollView_Previews: PreviewProvider {
    static var previews: some View {
//        CellVerticalTemplate()
        NewsCellVerticalScrollView(cells: [.init(author: "youssef", title: "Welcome to world", publishedAt: "25 Aug 2023", image: "Demo"),.init(author: "youssef", title: "Welcome to world", publishedAt: "25 Aug 2023", image: "Demo"),.init(author: "youssef", title: "Welcome to world", publishedAt: "25 Aug 2023", image: "Demo")])
    }
}
