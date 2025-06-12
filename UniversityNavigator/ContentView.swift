//
//  ContentView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-08.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Home"
    
    var body: some View {
        ZStack {
  
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
            
            VStack {
                Spacer()
                BottomNavigationBar(selectedTab: selectedTab) { tab in
                    selectedTab = tab
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
