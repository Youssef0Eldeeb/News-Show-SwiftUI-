//
//  NewsCellHorizontalScrollView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 24/08/2023.
//

import SwiftUI

struct CellTemplate: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Spacer()
            Text("Crypto investors should be prepared to lose all their money,BOE governor says")
                .font(.title3)
                .fontWeight(.bold)
                .fontDesign(.serif)
                .lineLimit(3)
            Text("I'm going to say this very bluntly again, he added.Buy them only if you're prepared to lose all your money.")
                .font(.footnote)
                .foregroundColor(Color.gray)
                .lineLimit(2)
            
        }
        .padding(10)
        .padding(.vertical, 20)
    }
}

struct NewsCellHorizontalScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack{
                ForEach(0..<10){item in

                        Image("earth")
                        .frame(width: 320)
                        .frame( maxHeight: .infinity)
                        .foregroundColor(.black)
                        .background(Color.cyan.opacity(0.6))
                        .overlay(alignment: .center) {
                            CellTemplate()
                        }
                         
                    
                }
            }
            
        }
        .padding(.leading)
        .frame(width: UIScreen.main.bounds.width, height: 250, alignment: .center)
        
        
    }
}

struct NewsCellHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
//        CellTemplate()
        NewsCellHorizontalScrollView()
    }
}
