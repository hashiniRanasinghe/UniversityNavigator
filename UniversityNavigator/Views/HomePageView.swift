//
//  HomePageView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-04.
//
//DONE -HASHINI

import SwiftUI

struct HomePageView: View {
    @State private var searchText = ""
    @State private var selectedTab = "Home"
    
    let pastelGreen = Color(red: 0.6, green: 0.85, blue: 0.7)    // soft green
    let pastelRed = Color(red: 1.0, green: 0.7, blue: 0.7)       // soft red
    let pastelOrange = Color(red: 1.0, green: 0.8, blue: 0.6)    // soft orange
    
    //low crowd
    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    //medium crowd
    let moderateColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    //high crowd
    let fullColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red
    
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
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            
            ScrollView {
                VStack(spacing: 25) {
                    // category btns
                    HStack(spacing: 0) {
                        NavigationLink(destination:
//                                        MapView())
                        CampusLibrariesView())
                        {
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
                          }
                    .padding(.horizontal, 20)
                    

                    
                    
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
                                    title: "Fitness Centre",status: "Free",
                                    statusColor: freeColor,
                                    spotsAvailable: "27/50 Spots Available",
                                    imageName: "gym"
                                )
                                
                                LocationCard(
                                    title: "Ezora Canteen",status: "Moderate",
                                    statusColor: moderateColor,spotsAvailable: "15/30 Spots Available",
                                    imageName: "cafe"
                                )
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    //quick directions
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
                                QuickDirectionCard(title: "Reid Library", imageName: "library")
                                QuickDirectionCard(title: "Program Office", imageName: "office")
                            }
                            
                            HStack(spacing: 12) {
                                QuickDirectionCard(title: "Hackett Cafe", imageName: "hcafe")
                                QuickDirectionCard(title: "Beasley Law Library ", imageName: "lawLibrary")
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.bottom, 100)
            }
            
            Spacer()
            
            
            // bottom nav bar
            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
           
                
                
            }
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
                            if let libraryImage = UIImage(named: "reid-library.png") {
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
                            if let gymImage = UIImage(named: "fitness-centre.png") {
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
                            if let cafeImage = UIImage(named: "reid-library.png") {
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
                        .cornerRadius(8)
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
                            if let libraryImage = UIImage(named: "reid-library.png") {
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
                            if let officeImage = UIImage(named: "program-office.png") {
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
                Button(action: {
                    // TODO: implement navigation
                }) {
                    Text("Directions")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .background(Color.black)
                        .cornerRadius(15)
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
