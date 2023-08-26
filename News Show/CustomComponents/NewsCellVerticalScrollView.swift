//
//  NewsCellVerticalScrollView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 24/08/2023.
//

import SwiftUI

struct NewsCellVerticalScrollView: View {
    var cellData: NewsCell
    var body: some View {
        ZStack {
            Image(cellData.image)
                .frame(width: UIScreen.main.bounds.width - 30, height: 120)
                .cornerRadius(10)
            
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
            .padding()
            .padding(.vertical, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 30, height: 120)
    }
    
}


struct NewsCellVerticalScrollView_Previews: PreviewProvider {
    static var previews: some View {
//        CellVerticalTemplate()
        NewsCellVerticalScrollView(cellData: .init(author: "youssef", title: "Welcome to world", publishedAt: "25 Aug 2023", image: "Demo"))
    }
}
