//
//  NewsCellVerticalScrollView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 24/08/2023.
//

import SwiftUI

struct NewsCellVerticalScrollView: View {
    var cellData: Article
    var body: some View {
        ZStack {
            
//            Image(cellData.urlToImage ?? "Demo")
//            AsyncImage(url: URL(string: "https://image.cnbcfm.com/api/v1/image/107300057-1694614982226-gettyimages-1662698220-AFP_33V72TZ.jpeg?v=1696005411&w=1920&h=1080"))
            AsyncImage(url: URL(string: "\(cellData.urlToImage ?? "")"))
                .frame(width: UIScreen.main.bounds.width - 30, height: 120)
                .scaledToFill()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 30) {
                Text(cellData.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .fontDesign(.serif)
                    .foregroundColor(Color.white)
                HStack {
                    Text(cellData.author ?? "No Author")
                    Spacer()
                    Text("\(cellData.publishedAt)")
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


//struct NewsCellVerticalScrollView_Previews: PreviewProvider {
//    static var previews: some View {
////        CellVerticalTemplate()
//        NewsCellVerticalScrollView(cellData: .init(author: "youssef", title: "Welcome to world", date: "25 Aug 2023", image: "Demo"))
//    }
//}
