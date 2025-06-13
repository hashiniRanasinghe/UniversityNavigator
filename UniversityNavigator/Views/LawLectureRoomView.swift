//
//  LawLectureRoomView.swift
//  UniversityNavigator
//
//  Created by Yalini 004  on 2025-06-12.
//

import SwiftUI

struct LawLectureRoomView: View {
    //@State private var selectedTab = "Halls"
    @Environment(\.dismiss) private var dismiss
    
    // Static values instead of parameters
    private let hallName = "Law Lecture Room 2"
    private let building = "338 - Law, Floor 1"
    private let seats = 120
    private let imageName = "LawLectureRoom"
    
    // Status colors
    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let scheduledColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    let occupiedColor = Color(red: 0.9, green: 0.4, blue: 0.4) // soft red
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                }
                
                Text(hallName)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.bottom, 20)
            
            ScrollView {
                VStack(spacing: 25) {
                    // Hall image
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                            .cornerRadius(12)
                            .overlay(
                                Group {
                                    if let hallImage = UIImage(named: "\(imageName).jpg") {
                                        Image(uiImage: hallImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 200)
                                            .frame(maxWidth: .infinity)
                                            .cornerRadius(12)
                                    } else {
                                        // Fallback image
                                        ZStack {
                                            Color.gray.opacity(0.3)
                                            VStack {
                                                Image(systemName: "building.2")
                                                    .font(.system(size: 40))
                                                    .foregroundColor(.gray)
                                                Text("Lecture Hall")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        .cornerRadius(12)
                                    }
                                }
                            )
                    }
                    .padding(.horizontal, 20)
                    
                    // Location and Seats info
                    HStack(spacing: 0) {
                        HStack(spacing: 8) {
                            Image(systemName: "location")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            Text(building)
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                        //Spacer()
                        Spacer().frame(width: 60)
                        
                        HStack(spacing: 8) {
                            Image(systemName: "person.2")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                            Text("Seats: \(seats)")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    // Availability Schedule Card
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Availability Schedule")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        // Schedule Card
                        VStack(spacing: 12) {
                            ScheduleItem(
                                time: "9.00 - 14.00",
                                title: nil,
                                lecturer:nil,
                                status: "Free",
                                statusColor: freeColor
                            )
                            
                            //Divider()
                               // .background(Color.gray.opacity(0.3))
                            
                            ScheduleItem(
                                time: "14.00 - 17.00",
                                title: "Introduction to Law",
                                lecturer: "Mrs. D.H.Herath",
                                status: "Scheduled",
                                statusColor: scheduledColor
                            )
                            
//                            Divider()
//                                .background(Color.gray.opacity(0.3))
                            
                            
                        }
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal, 20)
                    }
                    
                    // Resources
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Resources")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        
//                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 15) {
//                            ResourceItem(icon: "mic", title: "Microphone", color: .blue)
//                            ResourceItem(icon: "snowflake", title: "A/C", color: .blue)
//                            ResourceItem(icon: "wifi", title: "Wi-Fi", color: .blue)
//                            ResourceItem(icon: "tv", title: "Smart TV", color: .blue)
//                        }
                        
                        VStack(spacing: 15) {
                            HStack(spacing: 15) {
                                FacilityCard(
                                    icon: "mic", title: "Microphone", color: .blue
                                )
                                FacilityCard(
                                    icon: "snowflake", title: "A/C",
                                    color: .blue)
                            }

                            HStack(spacing: 15) {
                                FacilityCard(
                                    icon: "wifi", title: "Wi-Fi",
                                    color: .blue)
                                FacilityCard(
                                    icon: "tv", title: "Smart TV",
                                    color: .blue)
                            }
                        }
                        .padding(.horizontal, 0)
                    }
                    .padding(.horizontal, 20)
                    
                    // Get Directions Button
//                    Button(action: {
//                        getDirections()
//                    }) {
//                        Text("Get Directions")
//                            .font(.system(size: 18, weight: .semibold))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity)
//                            .padding(.vertical, 16)
//                            .background(Color.black)
//                            .cornerRadius(25)
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 120) // Space for bottom navigation
                    Button(action: {
                
                                    }) {
                                        Text("Get Directions")
                                            .font(.system(size: 16, weight: .semibold))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 16)
                                            .background(Color.black)
                                            .cornerRadius(25)
                                    }
                                    .padding(.horizontal, 100)
                                    .padding(.bottom, 20)
                                    .padding(.top, 10)
                }
            }
            
            Spacer()
            
            // Bottom Navigation
//            BottomNavigationBar(selectedTab: selectedTab) { tab in
//                selectedTab = tab
//                
//                // Handle navigation based on selected tab
//                switch tab {
//                case "Home":
//                    // Navigate to home
//                    break
//                case "Map":
//                    // Navigate to map
//                    break
//                case "Library":
//                    // Navigate to library
//                    break
//                case "Cafe":
//                    // Navigate to cafe
//                    break
//                case "Halls":
//                    // Navigate to halls
//                    break
//                case "Gym":
//                    // Navigate to gym
//                    break
//                case "Parking":
//                    // Navigate to parking
//                    break
//                default:
//                    break
//                }
//            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
    
//    private func getDirections() {
//        // TODO: Implement navigation to maps or directions
//        print("Getting directions to \(hallName)")
//        // You can add navigation to maps here
//        // For example, open Apple Maps or Google Maps with the hall location
//    }
}

struct ScheduleItemLawLectureRoom: View {
    let time: String
    let title: String?
    let lecturer: String?
    let status: String
    let statusColor: Color
    
    var body: some View {
        HStack(spacing: 9) {
            VStack(alignment: .leading, spacing: 4) {
                Text(time)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                
                if let title = title {
                    Text(title)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                if let lecturer = lecturer {
                    Text("Lecturer - \(lecturer)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            
            Spacer()
            
            Text(status)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white)
//                .padding(.horizontal, 12)
//                .padding(.vertical, 6)
                .frame(width: 90, height: 28)
                .background(statusColor)
                .cornerRadius(12)
        }
        .padding(.vertical, 8)
    }
}

struct ResourceItemLawLectureRoom: View {
    let icon: String
    let title: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 30)
            
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

// Bottom Navigation Bar (assuming you have this component)
//struct BottomNavigationBar: View {
//    let selectedTab: String
//    let onTabSelected: (String) -> Void
//
//    var body: some View {
//        HStack {
//            NavItem(icon: "house", title: "Home", isSelected: selectedTab == "Home") {
//                onTabSelected("Home")
//            }
//
//            NavItem(icon: "map", title: "Map", isSelected: selectedTab == "Map") {
//                onTabSelected("Map")
//            }
//
//            NavItem(icon: "building.2", title: "Places", isSelected: selectedTab == "Places") {
//                onTabSelected("Places")
//            }
//
//            NavItem(icon: "person.circle", title: "Profile", isSelected: selectedTab == "Profile") {
//                onTabSelected("Profile")
//            }
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 10)
//        .background(Color.white)
//        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -2)
//    }
//}

struct NavItemLawLectureRoom: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .black : .gray)
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(isSelected ? .black : .gray)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// Preview
struct LawLectureRoomViewPreviews: PreviewProvider {
    static var previews: some View {
        LawLectureRoomView()
    }
}
