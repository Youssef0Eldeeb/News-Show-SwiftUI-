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
        .padding()
        .foregroundColor(.gray.opacity(0.6))
        .background(
            RoundedRectangle(cornerRadius: 30)
                .stroke()
                .fill(Color.gray.opacity(0.6))
        )
        
    }
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(spacing: 15){
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
        }//: VStack
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
