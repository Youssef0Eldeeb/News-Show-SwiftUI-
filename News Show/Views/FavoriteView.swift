//
//  FavoriteView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/09/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    var arr: [Article] = [.init(  author: "youssef", title: "New Phone", description: "hello world", url: "", urlToImage: "Demo", publishedAt: "", content: ""),.init(  author: "youssef", title: "New Phone", description: "hello world", url: "", urlToImage: "Demo", publishedAt: "", content: ""),.init(  author: "youssef", title: "New Phone", description: "hello world", url: "", urlToImage: "Demo", publishedAt: "", content: ""),.init(  author: "youssef", title: "New Phone", description: "hello world", url: "", urlToImage: "Demo", publishedAt: "", content: ""),.init(  author: "youssef", title: "New Phone", description: "hello world", url: "", urlToImage: "Demo", publishedAt: "", content: "")]
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 10){
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        ForEach(arr.indices, id: \.self) { index in
                            NavigationLink {
                                NewsDetail(news: arr[index])
                            } label: {
                                NewsCellVerticalScrollView(cellData: arr[index])
                            }
                        }
                    }
                }

            }//: VStack
            .navigationTitle("Favorite")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
