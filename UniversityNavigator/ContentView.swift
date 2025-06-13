import SwiftUI

struct ContentView: View {
    @State private var showHomePage = false
    @State private var selectedTab = "Home"

    var body: some View {
        NavigationView {
            ZStack {
                if showHomePage {
                    VStack(spacing: 0) {
                        //contents
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
                            case "Resources":
                                CampusResourcesView()
                            default:
                                HomePageView()
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                        BottomNavigationBar(selectedTab: selectedTab) { tab in
                            selectedTab = tab
                        }
                        .background(Color.white)
                        .shadow(
                            color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
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
