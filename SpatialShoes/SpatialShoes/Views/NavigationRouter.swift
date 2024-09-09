//
//  NavigationRouter.swift
//  SpatialShoes
//
//  Created by Silvina Roldan on 09/09/2024.
//

import Foundation

@Observable
final class NavigationRouter {
    var selectedTab = Tab.home
}

enum Tab {
    case home
    case favorites
}
