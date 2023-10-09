//
//  TabBarView.swift
//  News Show
//
//  Created by Youssef Eldeeb on 23/08/2023.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedIndex: Int
    private let tabbarItems: [TabBarItem] = [.init(name: "Home", imageName: "house"),.init(name: "Favorite", imageName: "suit.heart"),.init(name: "Profile", imageName: "person.crop.circle") ]
    
    init(selectedIndex: Int) {
        UITabBar.appearance().isHidden = true
        self.selectedIndex = selectedIndex

    }
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedIndex) {
                HomeView(selectedIndex: 0)
                    .tag(0)
                FavoriteView()
                    .tag(1)
                Color(.red)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tag(2)
            }
            .ignoresSafeArea(edges: .bottom)
            
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
