//
//  ContentView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-08.
//

import SwiftUI

struct ContentView: View {
    @State private var showHomePage = false
    
    var body: some View {
        NavigationView {
            if showHomePage {
                HomePageView()
            } else {
                LandingPageView(showHomePage: $showHomePage)
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
