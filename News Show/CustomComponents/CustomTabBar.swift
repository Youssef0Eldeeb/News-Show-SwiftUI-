//
//  TabBarView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct SingleTabBarItem: View{
    var name: String
    var imageName: String
    var isActive: Bool = false
    var nameSpace: Namespace.ID
    
    var body: some View{
        if isActive{
            VStack(spacing: 5)  {
                Rectangle()
                    .frame(width: 30, height: 5)
                    .foregroundColor(.accentColor)
                    .cornerRadius(30)
                Image(systemName: imageName)
                    .foregroundColor(.accentColor)
                    .fontWeight(.bold)
                Text(name)
                    .font(.subheadline)
                    .padding(.horizontal)
                    .foregroundColor(.accentColor)
            }
            .matchedGeometryEffect(id: "highlightmenuite", in: nameSpace)
        }else{
            VStack(spacing: 5) {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                Text(name)
                    .font(.subheadline)
                    .padding(.horizontal)
                    .foregroundColor(.gray)
            }
        }
    }
}


struct CustomTabBar: View {
    
    var tabBarItems: [TabBarItem]
    @Binding var selectedIndex: Int
    @Namespace private var menuItemTransition
    
    var body: some View {
        ScrollViewReader { scrollView in
            HStack(spacing: 15){
                    ForEach(tabBarItems.indices, id: \.self){ index in
                        SingleTabBarItem(name: tabBarItems[index].name, imageName: tabBarItems[index].imageName, isActive: selectedIndex == index, nameSpace: menuItemTransition)
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
                .padding(8)
                .padding(.horizontal, 8)
                .background(Color("BackgroundColor"))
                .cornerRadius(40)
        }
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(tabBarItems: [.init(name: "home", imageName: "house"),.init(name: "home", imageName: "house"),.init(name: "home", imageName: "house")], selectedIndex: .constant(0))
            
    }
}
