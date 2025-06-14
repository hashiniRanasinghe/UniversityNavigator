//
//  HomePageView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-04.
//
//DONE

import SwiftUI
import CoreLocation

struct HomePageView: View {
    @State private var searchText = ""
    //@State private var selectedTab = "Home"
    
    let pastelGreen = Color(red: 0.6, green: 0.85, blue: 0.7)    // soft green
    let pastelRed = Color(red: 1.0, green: 0.7, blue: 0.7)       // soft red
    let pastelOrange = Color(red: 1.0, green: 0.8, blue: 0.6)    // soft orange
    
    //low crowd
    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    //medium crowd
    let moderateColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    //high crowd
    let fullColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red
    
    
    let campusLocations: [CampusLocation] = [
        
        CampusLocation(name: "Reid Library", category: .library,
                       coordinate: CLLocationCoordinate2D(latitude: -31.9790, longitude: 115.8175),
                       description: "Main university library"),
        CampusLocation(name: "Hackett Cafe", category: .cafeteria,
                       coordinate: CLLocationCoordinate2D(latitude: -31.9795, longitude: 115.8180),
                       description: "Main campus cafe and dining area"),
        CampusLocation(name: "Beasley Law Library", category: .library,
                       coordinate: CLLocationCoordinate2D(latitude: -31.9780, longitude: 115.8160),
                       description: "Specialized law library"),
        CampusLocation(name: "Administration Building", category: .admin,
                       coordinate: CLLocationCoordinate2D(latitude: -31.9785, longitude: 115.8175),
                       description: "Main administration and student services")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 20) {
                Text("Campus Navigator")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                // search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                    
                    TextField("Search locations...", text: $searchText)
                        .font(.system(size: 16))
                        .padding(.vertical, 12)
                    
                    Spacer()
                }
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            
            ScrollView {
                VStack(spacing: 25) {
                    // category btns
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            NavigationLink(destination: CampusLibrariesView()) {
                                CategoryButton(icon: "book", title: "Library", color: .blue)
                            }
                            
                            NavigationLink(destination: CampusCafeteriasView()) {
                                CategoryButton(icon: "cup.and.saucer", title: "Cafe", color: .blue)
                            }
                            
                            NavigationLink(destination: CampusLectureHallsView()) {
                                CategoryButton(icon: "building.2", title: "Halls", color: .blue)
                            }
                            
                            NavigationLink(destination: GymPageView()) {
                                CategoryButton(icon: "dumbbell", title: "Gym", color: .blue)
                            }
                            
                            NavigationLink(destination: CampusParkingView()) {
                                CategoryButton(icon: "car", title: "Parking", color: .blue)
                            }
                            
                            NavigationLink(destination: CampusResourcesView()) {
                                CategoryButton(icon: "globe", title: "Resources", color: .blue)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    
                    
                    //open Now
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Open Now")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        //
                        //                        let pastelGreen = Color(red: 0.6, green: 0.85, blue: 0.7)    // soft green
                        //                        let pastelRed = Color(red: 1.0, green: 0.7, blue: 0.7)       // soft red
                        //                        let pastelOrange = Color(red: 1.0, green: 0.8, blue: 0.6)    // soft orange
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                LocationCard(
                                    title: "Reid Library",status: "Busy",
                                    statusColor: fullColor,spotsAvailable: "10/100 Spots Available",
                                    imageName: "library"
                                    
                                )
                                
                                LocationCard(
                                    title: "Sports Centre",status: "Free",
                                    statusColor: freeColor,
                                    spotsAvailable: "27/50 Spots Available",
                                    imageName: "gym"
                                )
                                
                                LocationCard(
                                    title: "Ezone Canteen",status: "Moderate",
                                    statusColor: moderateColor,spotsAvailable: "15/30 Spots Available",
                                    imageName: "cafe"
                                )
                            }
                            .padding(.horizontal, 20)
                            Spacer()
                        }
                    }
                    
                    //
                    //                        VStack(spacing: 12) {
                    //                            HStack(spacing: 12) {
                    //                                QuickDirectionCard(
                    //                                    title: "Reid Library",
                    //                                    imageName: "library",
                    //                                    targetLocation: campusLocations.first { $0.name == "Reid Library" }
                    //                                )
                    //                            }
                    //                            HStack(spacing: 12) {
                    //                                QuickDirectionCard(
                    //                                    title: "Administration Building",
                    //                                    imageName: "office",
                    //                                    targetLocation: campusLocations.first { $0.name == "Administration Building" }
                    //                                )
                    //                            }
                    //                            HStack(spacing: 12) {
                    //                                QuickDirectionCard(
                    //                                    title: "Hackett Cafe",
                    //                                    imageName: "hcafe",
                    //                                    targetLocation: campusLocations.first { $0.name == "Hackett Cafe" }
                    //                                )
                    //                                QuickDirectionCard(
                    //                                    title: "Beasley Law Library",
                    //                                    imageName: "lawLibrary",
                    //                                    targetLocation: campusLocations.first { $0.name == "Beasley Law Library" }
                    //                                )
                    //                            }
                    //                        }
                    //
                    //                        .padding(.horizontal, 20)
                    //                    }
                    //
                    
                    //                    Spacer()
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Quick Directions")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 12) {
                            HStack(spacing: 12) {
                                QuickDirectionCard(title: "Reid Library", imageName: "library",      targetLocation: campusLocations.first { $0.name == "Reid Library" })
                                QuickDirectionCard(title: "Administration", imageName: "office",                targetLocation: campusLocations.first { $0.name == "Administration Building" })
                            }
                            
                            HStack(spacing: 12) {
                                QuickDirectionCard(title: "Hackett Cafe", imageName: "hcafe",     targetLocation: campusLocations.first { $0.name == "Hackett Cafe" })
                                QuickDirectionCard(title: "Beasley Law Library ", imageName: "lawLibrary",   targetLocation: campusLocations.first { $0.name == "Beasley Law Library" })
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    
                    
                }
                .padding(.bottom, 100)
            }
            
            Spacer()
            
            
            //            BottomNavigationBar(selectedTab: selectedTab) { tab in
            //                selectedTab = tab
            //
            //
            //                switch tab {
            //                case "Home":
            //                    HomePageView()
            //                    break
            //                case "Map":
            //                    MapView()
            //                    break
            //                case "Library":
            //                    CampusLibrariesView()
            //                    break
            //                case "Cafe":
            //                    CampusCafeteriasView()
            //                    break
            //
            //                default:
            //                    break
            //
            //                }
            //            }
        }
            .background(Color.white)
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    // category btns
    struct CategoryButton: View {
        let icon: String
        let title: String
        let color: Color
        
        var body: some View {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(color.opacity(0.1))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: icon)
                        .font(.system(size: 24))
                        .foregroundColor(color)
                }
                
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct LocationCard: View {
        let title: String
        let status: String
        let statusColor: Color
        let spotsAvailable: String
        let imageName: String
        
        var body: some View {
            VStack(spacing: 0) {
                
                //            let logoImage = UIImage(named: "Logo-light.png")
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 120)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                
                    .overlay(
                        Group {
                            if imageName == "library" {
                                if let libraryImage = UIImage(named: "library-488690.jpg") {
                                    Image(uiImage: libraryImage)
                                        .resizable()
                                    //                                    .frame(width: 200, height: 80)
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                }
                                else {
                                    Text("Library image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                                
                            } else if imageName == "gym" {
                                if let gymImage = UIImage(named: "fitness-centre.jpg") {
                                    Image(uiImage: gymImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                } else {
                                    Text("Gym image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                                
                            } else if imageName == "cafe" {
                                if let cafeImage = UIImage(named: "EzoneCafe.png") {
                                    Image(uiImage: cafeImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    //                                    .frame(width: 200, height: 120)
                                    //                                    .frame(height: 90)
                                        .frame(width: 200, height: 120)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    Text("Canteen image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                            }
                        }
                    )
                
                
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(title)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        // sts badge
                        Text(status)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(statusColor)
                            .cornerRadius(6)
                    }
                    
                    Text(spotsAvailable)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(12)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
    
    struct QuickDirectionCard: View {
        let title: String
        let imageName: String
        let targetLocation: CampusLocation?
        
        var body: some View {
            VStack(spacing: 0){
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 80)
                //                .cornerRadius(8, corners: [.topLeft, .topRight])
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                    .overlay(
                        Group {
                            if imageName == "library" {
                                if let libraryImage = UIImage(named: "library-488690.jpg") {
                                    Image(uiImage: libraryImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    //                                    .clipped()
                                    //                                    .frame(height: 60)
                                        .frame(height: 80)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                                } else {
                                    Text("image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                            } else if imageName == "office" {
                                if let officeImage = UIImage(named: "program-office.jpg") {
                                    Image(uiImage: officeImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    //                                    .clipped()
                                        .frame(height: 80)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                                } else {
                                    Text("image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                            } else if imageName == "hcafe" {
                                if let studentImage = UIImage(named: "hcafe.jpg") {
                                    Image(uiImage: studentImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    //                                    .clipped()
                                        .frame(height: 80)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                                } else {
                                    Text("image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                            } else if imageName == "lawLibrary" {
                                if let foodImage = UIImage(named: "lawLibrary.jpg") {
                                    Image(uiImage: foodImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    //                                    .clipped()
                                        .frame(height: 80)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                                    //                                    .frame(height: 60)
                                } else {
                                    Text("Image not found")
                                        .foregroundColor(.red)
                                        .font(.caption)
                                }
                            }
                        }
                    )
                
                
                VStack(spacing: 8) {
                    Text(title)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    // directions btn
                    NavigationLink(destination: MapView(targetLocation: targetLocation)) {
                        Text("Directions")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                }
                .padding(12)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
        }
    }
    
    
    struct BottomNavItem: View {
        let icon: String
        let title: String
        let isSelected: Bool
        
        var body: some View {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .blue : .gray)
                
                Text(title)
                    .font(.system(size: 10))
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    struct HomePageView_Previews: PreviewProvider {
        static var previews: some View {
            HomePageView()
        }
    }
