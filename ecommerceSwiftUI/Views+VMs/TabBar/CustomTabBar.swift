//
//  CustomTabBar.swift
//  ecommerceSwiftUI
//
//  Created by Achintha Kahawalage on 2021-05-29.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State private var selection: Int = 0
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection){
                HomeView()
                    .tabItem {
                        selection == 0 ? Image(systemName: "house.fill") : Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                ProfileView()
                    .tabItem {
                        selection == 1 ? Image(systemName: "person.fill") : Image(systemName: "person")
                        Text("My Profile")
                    }
                    .tag(1)
                CartView()
                    .tabItem {
                        selection == 2 ? Image(systemName: "cart.fill") : Image(systemName: "cart")
                        Text("Cart")
                    }
                    .tag(2)
                MoreView()
                    .tabItem {
                        selection == 3 ? Image(systemName: "list.dash") : Image(systemName: "list.dash")
                        Text("More")
                    }
                    .tag(3)
            }
            .accentColor(Color.blue)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

