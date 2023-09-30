//
//  HomeView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @State var selectedIndex: Int
    
    let categoryArray = Category.allCases.map { $0.rawValue }
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
                        ForEach(viewModel.newsResult.indices, id: \.self) { index in
                            NavigationLink {
                                NewsDetail(news: viewModel.newsResult[index])
                            } label: {
                                NewsCellHorizontalScrollView(cell: viewModel.newsResult[index])
                            }
                        }
                    } 
                }
                .padding(.leading, 15)
                .frame(height: 250)
                
                CatogeryHorizontalScrollableView(cellItems: categoryArray.map({$0.capitalized}), selectedIndex: $selectedIndex)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        ForEach(viewModel.newsCategoryResult.indices, id: \.self) { index in
                            NavigationLink {
                                NewsDetail(news: viewModel.newsCategoryResult[index])
                            } label: {
                                NewsCellVerticalScrollView(cellData: viewModel.newsCategoryResult[index])
                            }
                        }
                    }
                }
            }//: VStack
        }.onAppear{
            viewModel.getTopHeadlinesNews(category: nil)
            viewModel.getTopHeadlinesNews(category: Category.allCases[selectedIndex])
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(selectedIndex: 0)
    }
}
