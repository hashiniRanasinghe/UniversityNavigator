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
            
            BottomNavItem(icon: "square.grid.2x2", title: "Item 3", isSelected: selectedTab == "Item 3")
                .onTapGesture { onTabSelected("Item 3") }
            
            BottomNavItem(icon: "ellipsis", title: "Item 4", isSelected: selectedTab == "Item 4")
                .onTapGesture { onTabSelected("Item 4") }
            
            BottomNavItem(icon: "person.fill", title: "Profile", isSelected: selectedTab == "Profile")
                .onTapGesture { onTabSelected("Profile") }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}
