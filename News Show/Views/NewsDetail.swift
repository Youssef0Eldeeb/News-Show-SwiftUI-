//
//  NewsDetail.swift
//  News Show
//
//  Created by Youssef Eldeeb on 26/08/2023.
//

import SwiftUI

struct NewsDetail: View {
    var body: some View {
        ZStack {
            VStack(spacing: -35){
                Image("Demo")
                    .resizable()
    //                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                ScrollView{
                    Text("LONDON - Cryptocurrencies \"have no intrinsic value and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward $20,000, only to sink as low as $3,122 a year later.Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: They intrinsic value. That doesn't mean to say peo put value on them, because they can have extrinsic value. But they have no intrinsic value.LONDON - Cryptocurrencies \"have no intrinsic value and people who invest in them should be prepared to lose all their money, Bank of England Governor Andrew Bailey said.Digital currencies like bitcoin, ether and even dogecoin have been on a tear this year, reminding some investors of the 2017 crypto bubble in which bitcoin blasted toward $20,000, only to sink as low as $3,122 a year later.Asked at a press conference Thursday about the rising value of cryptocurrencies, Bailey said: They intrinsic value. That doesn't mean to say peo put value on them, because they can have extrinsic value. But they have no intrinsic value.")
                        .padding(.top)
                }
                .padding()
                .padding(.top, 70)
                .background()
                .roundedCorner(30, corners: [.topLeft, .topRight])
            }//: VStack
            .ignoresSafeArea( edges: .top)
            .padding(.horizontal, -1)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Sunday, 9 May 2021")
                    .font(.footnote)
                Text("Crypto investors should be prepared to lose all their money, BOE governor says")
                    .fontDesign(.serif)
                    .font(.headline)
                    .lineLimit(3)
                Text("Published by" + "Ryan Browne")
                    .font(.footnote.bold())
            }
            .padding()
            .background(.selection.opacity(0.8))
            .foregroundColor(.white)
            .frame(width: 300, height: 150)
            .cornerRadius(20)
            .offset(x: 0, y: -45)
        }//: ZStack
        
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail()
    }
}
