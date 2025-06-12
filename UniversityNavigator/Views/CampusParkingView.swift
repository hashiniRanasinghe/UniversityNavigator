//
//  CampusParkingView.swift
//  UniversityNavigator
//
//  Created by Developer on 2025-06-08.
//
//DONE

import SwiftUI
import CoreLocation

struct CampusParkingView: View {
    @State private var selectedTab = "Parking"
    @Environment(\.dismiss) private var dismiss
    
    //low crowd
    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    //medium crowd
    let moderateColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    //high crowd
    let fullColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red
    

    var body: some View {
        VStack(spacing: 0) {
 
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                    
                    Text("Campus Parking")
                         .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            
            ScrollView {
                VStack(spacing: 25) {
                  //parking 1
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Staff Parking")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        ParkingCard(
                            imageName: "staff_parking",
                            status: "Open",
                            statusColor: Color.green,
                            weekdayHours: "7.30am-8.30pm",
                            weekendHours: "7.30am-8.30pm",
                            location: "Adjacent to the Reid Library",
                            availableSpots: 5,
                            totalSpots: 50,
                            weekendStatus: "Available",
                            weekendStatusColor: moderateColor,
                            targetLocation: staffParkingLocation
                            
                        )
                    }
                    
                    //parking2
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Student & Visitor Parking")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                             Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        ParkingCard(
                            imageName: "student_parking",
                            status: "Open",
                            statusColor: Color.green,
                            weekdayHours: "7.30am-8.30pm",
                            weekendHours: "9.00am-8.30pm",
                            location: "Near Hackett Hall",
                            availableSpots: 25,
                            totalSpots: 100,
                            weekendStatus: "Free",
                            weekendStatusColor: freeColor,
                            
                            targetLocation: studentParkingLocation
                        )
                    }
                }
                .padding(.bottom, 120)
            }
            Spacer()
            
            
        
//            BottomNavigationBar(selectedTab: selectedTab) { tab in
//                selectedTab = tab
//            }
            
            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
                
                // Handle navigation based on selected tab
                switch tab {
                case "Home":
                    // Navigate to home
                    break
                case "Map":
                    // Navigate to map
                    break
                case "Library":
                    // Navigate to library
                    break
                case "Cafe":
                    // Navigate to cafe
                    break
                case "Halls":
                    // Navigate to halls
                    break
                case "Gym":
                    // Navigate to gym
                    break
                case "Parking":
                    // Navigate to parking
                    break
                default:
                    break
                }
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}
        let staffParkingLocation = CampusLocation(
    name: "Staff Parking",
    category: .parking,
    coordinate: CLLocationCoordinate2D(latitude: -31.9790, longitude: 115.8175),
    description: "Staff parking adjacent to Reid Library"
        )

        let studentParkingLocation = CampusLocation(
    name: "Student & Visitor Parking",
    category: .parking,
    coordinate: CLLocationCoordinate2D(latitude: -31.9795, longitude: 115.8180), 
    description: "Student and visitor parking near Hackett Hall"
        )
struct ParkingCard: View {
    let imageName: String
    let status: String
    let statusColor: Color
    let weekdayHours: String
    let weekendHours: String
    let location: String
    let availableSpots: Int
    let totalSpots: Int
    let weekendStatus: String
    let weekendStatusColor: Color
    let targetLocation: CampusLocation
    
    var body: some View {
        VStack(spacing: 0) {
         
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
//                    .fill(Color.white.opacity(0.2))
                    .frame(height: 140)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
//                    .background(
//                        RoundedRectangle(cornerRadius: 16, style: .continuous)
//                            .fill(Color.white.opacity(0.15))
//                    )
//                    .frame(height: 140)
//                    .clipShape(RoundedCornerShape(topLeft: 16, topRight: 16))

                    .overlay(
                        
                        Group {
                            if imageName == "staff_parking" {
                                if let staffParkingImage =
//                                    UIImage(named: "staff-parking.jpg") {
                                    UIImage(named: "staff-parking.jpg") {
                                        Image(uiImage: staffParkingImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                              
                                    ZStack {
                                        Color.gray.opacity(0.3)
                                        VStack {
                                            Image(systemName: "car.fill")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Staff Parking")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                
                            } else if imageName == "student_parking" {
                                if let studentParkingImage = UIImage(named: "staff-parking.jpg") {
                                    Image(uiImage: studentParkingImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                    
                                } else {
                                 
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "car.2.fill")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Student Parking")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    )
                
         
                    Text(status)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(statusColor)
                    .cornerRadius(12)
                    .padding(.top, 12)
                    .padding(.trailing, 12)
            }
            
     
            VStack(alignment: .leading, spacing: 8) {
         
                    VStack(spacing: 6) {
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("Open (weekdays): \(weekdayHours)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
             
                        Spacer()
                    }
                    
                HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font (.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("Open (weekend): \(weekendHours)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                 
                    Text(weekendStatus)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(weekendStatusColor)
                            .cornerRadius(8)
                    }
                }
                
          
            HStack(spacing: 8) {
                    Image(systemName: "location")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text(location)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
             
                
                    HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(availableSpots)/\(totalSpots)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                        
                    VStack(alignment: .leading, spacing: 2) {
                            Text("Spots")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        
                            Text("Available")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                        
               
                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                    Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 4)
                                    .cornerRadius(2)
                                
                                Rectangle()
                                    .fill(availableSpots > 0 ? Color.green : Color.red)
                                    .frame(width: geometry.size.width * CGFloat(availableSpots) / CGFloat(totalSpots), height: 4)
                                    .cornerRadius(2)
                            }
                        }
                            .frame(height: 4)
                            .frame(maxWidth: 150)
                    }
                    
                    Spacer()
                    
            
                    NavigationLink(destination: MapView(targetLocation: targetLocation)) {
                          Text("Get Directions")
                              .font(.system(size: 14, weight: .medium))
                              .foregroundColor(.white)
                              .padding(.horizontal, 20)
                              .padding(.vertical, 12)
                              .background(Color.black)
                              .cornerRadius(25)
                      }
                }
            }
            .padding(16)
            
            
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}

struct CampusParkingView_Previews: PreviewProvider {
    static var previews: some View {
        CampusParkingView()
    }
}
