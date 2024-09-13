//
//  ContentView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/09/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(NavigationRouter.self) private var router
    @Environment(ShoesViewModel.self) private var shoesVM

    var body: some View {
        @Bindable var router = router

        TabView(selection: $router.selectedTab) {
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
        .onChange(of: router.selectedTab) { _, newValue in
//            if newValue == .favorites && shoesVM.getFavoriteShoes().isEmpty {
//                router.selectedTab = .home
//            }
        }
    }
}
