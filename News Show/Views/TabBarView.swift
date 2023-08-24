//
//  TabBarView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedIndex: Int
    private let colors: [Color] = [.yellow, .blue , .green, .brown]
    private let tabbarItems: [TabBarItem] = [.init(name: "Home", imageName: "house"),.init(name: "Favorite", imageName: "suit.heart"),.init(name: "Profile", imageName: "person.crop.circle") ]
    var body: some View {
        ZStack{
            TabView(selection: $selectedIndex) {
                ForEach(colors.indices, id: \.self) { index in
                    colors[index]
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tag(index)
                        .ignoresSafeArea()
                }
            }
            VStack{
                Spacer()
                CustomTabBar(tabBarItems: tabbarItems, selectedIndex: $selectedIndex)
                    .padding(.horizontal)
            }
        }
    }
}

struct TabBarVieww_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedIndex: 0)
    }
}
