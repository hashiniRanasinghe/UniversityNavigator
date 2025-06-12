//
//  NavBar.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-05.
//

import SwiftUI
//
//struct BottomNavigationBar: View {
//    var selectedTab: String
//    var onTabSelected: (String) -> Void
//    
//    var body: some View {
//        HStack {
//            BottomNavItem(icon: "house.fill", title: "Home", isSelected: selectedTab == "Home")
//                .onTapGesture { onTabSelected("Home") }
//            
//            BottomNavItem(icon: "location.fill", title: "Map", isSelected: selectedTab == "Map")
//                .onTapGesture { onTabSelected("Map") }
//            
//            BottomNavItem(icon: "square.grid.2x2", title: "Halls", isSelected: selectedTab == "Halls")
//                .onTapGesture { onTabSelected("Halls") }
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 15)
//        .background(Color.white)
//        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
//    }
//}

//struct BottomNavigationBar: View {
//    var selectedTab: String
//    var onTabSelected: (String) -> Void
//    @State private var showMoreMenu = false
//    
//    // Define which tabs should show in the main nav vs More menu
//    private var mainTabs = ["Home", "Map"]
//    private var moreTabs = ["Library", "Cafe", "Halls", "Gym", "Parking"]
//    
//    private var isMoreTabSelected: Bool {
//        moreTabs.contains(selectedTab)
//    }
//    
//    var body: some View {
//        ZStack {
//            // Main Navigation Bar
//            HStack {
//                BottomNavItem(icon: "house.fill", title: "Home", isSelected: selectedTab == "Home")
//                    .onTapGesture {
//                        showMoreMenu = false
//                        onTabSelected("Home")
//                    }
//                
//                BottomNavItem(icon: "location.fill", title: "Map", isSelected: selectedTab == "Map")
//                    .onTapGesture {
//                        showMoreMenu = false
//                        onTabSelected("Map")
//                    }
//                
//                // Dynamic third tab - shows current selection or "More"
//                if isMoreTabSelected {
//                    BottomNavItem(
//                        icon: iconForTab(selectedTab),
//                        title: selectedTab,
//                        isSelected: true
//                    )
//                    .onTapGesture {
//                        withAnimation(.easeInOut(duration: 0.2)) {
//                            showMoreMenu.toggle()
//                        }
//                    }
//                } else {
//                    BottomNavItem(icon: "line.3.horizontal", title: "More", isSelected: showMoreMenu)
//                        .onTapGesture {
//                            withAnimation(.easeInOut(duration: 0.2)) {
//                                showMoreMenu.toggle()
//                            }
//                        }
//                }
//            }
//            .padding(.horizontal, 20)
//            .padding(.vertical, 15)
//            .background(Color.white)
//            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
//            
//            // More Menu Dropdown
//            if showMoreMenu {
//                VStack(spacing: 0) {
//                    Spacer()
//                    
//                    VStack(spacing: 0) {
//                        // Menu Items
//                        MoreMenuItem(
//                            icon: "books.vertical.fill",
//                            title: "Library",
//                            isSelected: selectedTab == "Library"
//                        ) {
//                            onTabSelected("Library")
//                            showMoreMenu = false
//                        }
//                        
//                        Divider()
//                            .background(Color.gray.opacity(0.3))
//                        
//                        MoreMenuItem(
//                            icon: "cup.and.saucer.fill",
//                            title: "Cafe",
//                            isSelected: selectedTab == "Cafe"
//                        ) {
//                            onTabSelected("Cafe")
//                            showMoreMenu = false
//                        }
//                        
//                        Divider()
//                            .background(Color.gray.opacity(0.3))
//                        
//                        MoreMenuItem(
//                            icon: "building.2.fill",
//                            title: "Halls",
//                            isSelected: selectedTab == "Halls"
//                        ) {
//                            onTabSelected("Halls")
//                            showMoreMenu = false
//                        }
//                        
//                        Divider()
//                            .background(Color.gray.opacity(0.3))
//                        
//                        MoreMenuItem(
//                            icon: "dumbbell.fill",
//                            title: "Gym",
//                            isSelected: selectedTab == "Gym"
//                        ) {
//                            onTabSelected("Gym")
//                            showMoreMenu = false
//                        }
//                        
//                        Divider()
//                            .background(Color.gray.opacity(0.3))
//                        
//                        MoreMenuItem(
//                            icon: "car.fill",
//                            title: "Parking",
//                            isSelected: selectedTab == "Parking"
//                        ) {
//                            onTabSelected("Parking")
//                            showMoreMenu = false
//                        }
//                    }
//                    .background(Color.white)
//                    .cornerRadius(12)
//                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: -4)
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 85) // Adjust based on your bottom nav height
//                    .transition(.move(edge: .bottom).combined(with: .opacity))
//                }
//                .background(Color.clear)
//                .onTapGesture {
//                    withAnimation(.easeInOut(duration: 0.2)) {
//                        showMoreMenu = false
//                    }
//                }
//            }
//        }
//    }
//    
//    // Helper function to get icon for each tab
//    private func iconForTab(_ tab: String) -> String {
//        switch tab {
//        case "Library":
//            return "books.vertical.fill"
//        case "Cafe":
//            return "cup.and.saucer.fill"
//        case "Halls":
//            return "building.2.fill"
//        case "Gym":
//            return "dumbbell.fill"
//        case "Parking":
//            return "car.fill"
//        default:
//            return "line.3.horizontal"
//        }
//    }
//}
//
//struct MoreMenuItem: View {
//    let icon: String
//    let title: String
//    let isSelected: Bool
//    let action: () -> Void
//    
//    var body: some View {
//        Button(action: action) {
//            HStack(spacing: 15) {
//                Image(systemName: icon)
//                    .font(.system(size: 18))
//                    .foregroundColor(isSelected ? .blue : .black)
//                    .frame(width: 24)
//                
//                Text(title)
//                    .font(.system(size: 16, weight: isSelected ? .semibold : .medium))
//                    .foregroundColor(isSelected ? .blue : .black)
//                
//                Spacer()
//                
//                if isSelected {
//                    Image(systemName: "checkmark")
//                        .font(.system(size: 14, weight: .medium))
//                        .foregroundColor(.blue)
//                } else {
//                    Image(systemName: "chevron.right")
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding(.horizontal, 20)
//            .padding(.vertical, 16)
//        }
//        .background(isSelected ? Color.blue.opacity(0.1) : Color.white)
//    }
//}
//
//struct BtmNavItem: View {
//    let icon: String
//    let title: String
//    let isSelected: Bool
//    
//    var body: some View {
//        VStack(spacing: 4) {
//            Image(systemName: icon)
//                .font(.system(size: 20))
//                .foregroundColor(isSelected ? .black : .gray)
//            
//            Text(title)
//                .font(.system(size: 12, weight: .medium))
//                .foregroundColor(isSelected ? .black : .gray)
//        }
//        .frame(maxWidth: .infinity)
//    }
//}


struct BottomNavigationBar: View {
    let selectedTab: String
    let onTabSelected: (String) -> Void
    @State private var showMoreMenu = false
    
    // Explicit public initializer
    init(selectedTab: String, onTabSelected: @escaping (String) -> Void) {
        self.selectedTab = selectedTab
        self.onTabSelected = onTabSelected
    }
    
    // Define which tabs should show in the main nav vs More menu
    private var mainTabs = ["Home", "Map"]
    private var moreTabs = ["Library", "Cafe", "Halls", "Gym", "Parking"]
    
    private var isMoreTabSelected: Bool {
        moreTabs.contains(selectedTab)
    }
    
    var body: some View {
        ZStack {
            // Main Navigation Bar
            HStack {
                CustomBottomNavItem(icon: "house.fill", title: "Home", isSelected: selectedTab == "Home")
                    .onTapGesture {
                        showMoreMenu = false
                        onTabSelected("Home")
                    }
                
                CustomBottomNavItem(icon: "location.fill", title: "Map", isSelected: selectedTab == "Map")
                    .onTapGesture {
                        showMoreMenu = false
                        onTabSelected("Map")
                    }
                
                // Dynamic third tab - shows current selection or "More"
                if isMoreTabSelected {
                    CustomBottomNavItem(
                        icon: iconForTab(selectedTab),
                        title: selectedTab,
                        isSelected: true
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showMoreMenu.toggle()
                        }
                    }
                } else {
                    CustomBottomNavItem(icon: "line.3.horizontal", title: "More", isSelected: showMoreMenu)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                showMoreMenu.toggle()
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color.white)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
            
            // More Menu Dropdown
            if showMoreMenu {
                VStack(spacing: 0) {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        // Menu Items
                        MoreMenuItem(
                            icon: "book.fill",
                            title: "Library",
                            isSelected: selectedTab == "Library"
                        ) {
                            onTabSelected("Library")
                            showMoreMenu = false
                        }
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                        
                        MoreMenuItem(
                            icon: "cup.and.saucer.fill",
                            title: "Cafe",
                            isSelected: selectedTab == "Cafe"
                        ) {
                            onTabSelected("Cafe")
                            showMoreMenu = false
                        }
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                        
                        MoreMenuItem(
                            icon: "building.2.fill",
                            title: "Halls",
                            isSelected: selectedTab == "Halls"
                        ) {
                            onTabSelected("Halls")
                            showMoreMenu = false
                        }
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                        
                        MoreMenuItem(
                            icon: "dumbbell.fill",
                            title: "Gym",
                            isSelected: selectedTab == "Gym"
                        ) {
                            onTabSelected("Gym")
                            showMoreMenu = false
                        }
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                        
                        MoreMenuItem(
                            icon: "car.fill",
                            title: "Parking",
                            isSelected: selectedTab == "Parking"
                        ) {
                            onTabSelected("Parking")
                            showMoreMenu = false
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: -4)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 85) // Adjust based on your bottom nav height
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                .background(Color.clear)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showMoreMenu = false
                    }
                }
            }
        }
    }
    
    // Helper function to get icon for each tab
    private func iconForTab(_ tab: String) -> String {
        switch tab {
        case "Library":
            return "books.vertical.fill"
        case "Cafe":
            return "cup.and.saucer.fill"
        case "Halls":
            return "building.2.fill"
        case "Gym":
            return "dumbbell.fill"
        case "Parking":
            return "car.fill"
        default:
            return "line.3.horizontal"
        }
    }
}

struct MoreMenuItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                    .foregroundColor(isSelected ? .blue : .black)
                    .frame(width: 24)
                
                Text(title)
                    .font(.system(size: 16, weight: isSelected ? .semibold : .medium))
                    .foregroundColor(isSelected ? .blue : .black)
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
        }
        .background(isSelected ? Color.blue.opacity(0.1) : Color.white)
    }
}

struct CustomBottomNavItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .blue : .gray)
            
            Text(title)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(isSelected ? .blue: .gray)
        }
        .frame(maxWidth: .infinity)
    }
}
