//
//  NewsDetail.swift
//  News Show
//
//  Created by Youssef Eldeeb on 26/08/2023.
//

import SwiftUI

struct NewsDetail: View {
    
    @Environment(\.dismiss) var dismiss
    var news: NewsCell
    var body: some View {
        ZStack {
            VStack(spacing: -35){
                ZStack {
                    Image(news.image)
                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                    VStack{
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.backward")
                                    .padding(10)
                                    .padding(.horizontal, 5)
                                    .font(.title3.bold())
                                    .foregroundColor(.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15).foregroundColor(.accentColor.opacity(0.8))
                                    )
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 30)
                }
                    
                ZStack {
                    ScrollView{
                        Text(news.description ?? "No Descrioption")
                            .padding(.top)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 3 + 20)
                    .padding()
                    .padding(.top, 70)
                    .background()
                    .roundedCorner(30, corners: [.topLeft, .topRight])
                    
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Button {
                                //
                            } label: {
                                Image(systemName: "heart")
                                    .padding(15)
                                    .font(.title2.bold())
                                    .foregroundColor(.white)
                                    .background(Circle().foregroundColor(.accentColor.opacity(0.9)))
                            }
                        }//: HStack
                        .padding()
                    }//: VStack
                    .padding()
                }//: ZStack
            }//: VStack
            .ignoresSafeArea( edges: .top)
            .padding(.horizontal, -1)
            
            VStack(alignment: .leading, spacing: 10){
                Text(news.publishedAt ?? "No Date")
                    .font(.footnote)
                Text(news.title)
                    .fontDesign(.serif)
                    .font(.headline)
                    .lineLimit(3)
                Text("Published by " + news.author)
                    .font(.footnote.bold())
            }
            .frame(width: 280, height: 130)
            .padding()
            .background(Color.accentColor.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(20)
            .offset(x: 0, y: -45)
        }//: ZStack
        .navigationBarBackButtonHidden(true)
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(news: .init(author: "youssef", title: "Hello to world Hello to world Hello to world  Hello to worldHello to world ", description: "Next is another function, if_max_lol(), that is identical to if_max(), except that it adds a single print(\"lol”) statement: I benchmark them on my M1 Apple Pro on an increasing array. Following…", image: "Demo"))
    }
}
