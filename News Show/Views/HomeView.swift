//
//  HomeView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct HomeView: View {
    var searchView: some View{
        HStack{
            Text("Search")
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .padding(10)
        .foregroundColor(.gray.opacity(0.6))
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke()
                .fill(Color.gray.opacity(0.6))
        )
        
    }
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(spacing: 10){
                searchView
                Button {
                    //
                } label: {
                    Image(systemName: "bell.badge")
                        .padding(10)
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Circle().foregroundColor(.accentColor.opacity(0.9)))
                }
            }//: HStack
            .padding(10)
            NewsCellHorizontalScrollView(cells: [.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", description: "I'm going to say this very bluntly again, he added. Buy them only if you're prepared to lose all your money.", image: "Demo"),.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", image: "Demo"),.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", image: "Demo"),.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", image: "Demo")])
            CatogeryHorizontalScrollableView(cellItems: ["Healthy","Technology", "Finance", "Arts", "Sports"], selectedIndex: 0)
            NewsCellVerticalScrollView(cells: [.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021", image: "Demo"),.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021", image: "Demo"),.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021", image: "Demo"),.init(author: "youssef", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021", image: "Demo")])
        }//: VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
