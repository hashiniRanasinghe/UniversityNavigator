//
//  ContentView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-08.
//

import SwiftUI

struct ContentView: View {
    @State private var showHomePage = false
    @State private var selectedTab = "Home"

    var body: some View {
        NavigationView {
            ZStack {
                if showHomePage {
                    Group {
                        switch selectedTab {
                        case "Home":
                            HomePageView()
                        case "Map":
                            MapView(targetLocation: nil)
                        case "Library":
                            CampusLibrariesView()
                        case "Cafe":
                            CampusCafeteriasView()
                        case "Halls":
                            CampusLectureHallsView()
                        case "Gym":
                            GymPageView()
                        case "Parking":
                            CampusParkingView()
                        default:
                            HomePageView()
                        }
                    }
                    .overlay(
                        VStack {
                            Spacer()
                            BottomNavigationBar(selectedTab: selectedTab) { tab in
                                selectedTab = tab
                            }
                        }
                    )
                } else {
                    LandingPageView(showHomePage: $showHomePage)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
