//
//  ContentView.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 08/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("home")
            Favorites()
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
                .tag("favorites")
        }
    }
}
