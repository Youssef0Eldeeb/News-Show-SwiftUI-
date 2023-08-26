//
//  HomeView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct HomeView: View {
    
    var newsArray: [NewsCell] = [.init(author: "youssef 1", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says",publishedAt: "Sunday, 9 May 2021", description: "LONDON - Cryptocurrencies \"have no intrinsic value ", image: "Demo"),.init(author: "youssef 2", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021",description: "LONDON - Cryptocurrencies \"have no intrinsic valueLONDON - Cryptocurrencies \"have no intrinsic valueLONDON - Cryptocurrencies \"have no intrinsic valueLONDON - Cryptocurrencies \"have no intrinsic value", image: "Demo"),.init(author: "youssef3", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021", image: "Demo"),.init(author: "youssef 4", title: "Crypto investors should be prepared to lose all their money,BOEgovernor says", publishedAt: "Sunday, 9 May 2021", image: "Demo")]
    
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
        NavigationView {
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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(newsArray.indices, id: \.self) { index in
                            NavigationLink {
                                NewsDetail(news: newsArray[index])
                            } label: {
                                NewsCellHorizontalScrollView(cell: newsArray[index])
                            }
                        }
                    } 
                }
                .padding(.leading, 15)
                .frame(height: 250)
                CatogeryHorizontalScrollableView(cellItems: ["Healthy","Technology", "Finance", "Arts", "Sports"], selectedIndex: 0)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        ForEach(newsArray.indices, id: \.self) { index in
                            NavigationLink {
                                NewsDetail(news: newsArray[index])
                            } label: {
                                NewsCellVerticalScrollView(cellData: newsArray[index])
                            }
                        }
                    }
                }
            }
        }//: VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
