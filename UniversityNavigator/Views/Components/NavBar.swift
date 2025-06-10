//
//  NavBar.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-05.
//

import SwiftUI

struct BottomNavigationBar: View {
    var selectedTab: String
    var onTabSelected: (String) -> Void
    
    var body: some View {
        HStack {
            BottomNavItem(icon: "house.fill", title: "Home", isSelected: selectedTab == "Home")
                .onTapGesture { onTabSelected("Home") }
            
            BottomNavItem(icon: "location.fill", title: "Map", isSelected: selectedTab == "Map")
                .onTapGesture { onTabSelected("Map") }
            
            BottomNavItem(icon: "square.grid.2x2", title: "Halls", isSelected: selectedTab == "Halls")
                .onTapGesture { onTabSelected("Halls") }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}
