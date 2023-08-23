//
//  CatogeryHorizontalScrollableView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 24/08/2023.
//

import SwiftUI

struct CellItem: View{
    var name: String
    var isActive: Bool = false
    var nameSpace: Namespace.ID
    
    var body: some View{
        if isActive{
            Text(name)
                .font(.headline)
                .padding(.horizontal)
                .padding(10)
                .foregroundColor(.white)
                .background(Rectangle().foregroundColor(.accentColor.opacity(0.8)).cornerRadius(18))
                .matchedGeometryEffect(id: "highlightmenuite", in: nameSpace)
        }else{
            Text(name)
                .font(.headline)
                .padding(.horizontal)
                .padding(10)
                .foregroundColor(.black)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(lineWidth: 1)
                        .fill(Color.gray.opacity(0.4))
                )
        }
    }
}



struct CatogeryHorizontalScrollableView: View {
    var cellItems: [String]
    @State var selectedIndex: Int
    @Namespace private var menuItemTransition
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                    ForEach(cellItems.indices, id: \.self){ index in
                        CellItem(name: cellItems[index], isActive: selectedIndex == index, nameSpace: menuItemTransition)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    selectedIndex = index
                                }
                            }
                            .onChange(of: selectedIndex) { newValue in
                                withAnimation {
                                    scrollView.scrollTo(newValue, anchor: .center)
                                }
                            }
                    }
                } //: HStack
                .padding(10)
                .background(Color(.white))
                .cornerRadius(25)
            }//: ScrollView
        }
    }
}

struct CatogeryHorizontalScrollableView_Previews: PreviewProvider {
    static var previews: some View {
        CatogeryHorizontalScrollableView(cellItems: ["item1","item2","item3","item4","item5","item6" ], selectedIndex: 0)
    }
}
