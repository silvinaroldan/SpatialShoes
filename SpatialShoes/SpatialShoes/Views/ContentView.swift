//
//  ContentView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/09/2024.
//

import SwiftUI


struct ContentView: View {
    
    @Environment(NavigationRouter.self) private var router

    var body: some View {
        @Bindable var router = router
        
        TabView(selection: $router.selectedTab ) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            Favorites()
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
                .tag(Tab.favorites)
        }
    }
}
