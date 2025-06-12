//
//  CampusLectureHallsView.swift
//  UniversityNavigator
//
//  Created by Developer on 2025-06-07.
//

//import SwiftUI
//
import SwiftUI

struct CampusLectureHallsView: View {
    @State private var selectedTab = "Halls"
    @State private var selectedCategory = "All Lecture Halls"
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    
    let categories = ["All Lecture Halls", "Occupied", "Free"]
    

    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let scheduledColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    let occupiedColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red

    var body: some View {
        VStack(spacing: 0) {
            // Header section
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                    Text("Campus Lecture Halls")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            
            // Fixed search bar and categories section
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    
                    TextField("Search lecture halls...", text: $searchText)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(25)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                // filter categories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                                
                            }) {
                                Text(category)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(selectedCategory == category ? .white : .black)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .background(selectedCategory == category ? Color.black : Color.clear)
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.bottom, 15)
            
            .background(Color.white)
            
            // Scrollable view -Start
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    LectureHallCard(
                        name: "Anatomy Lecture Room 181",
                        building: "344 - Anatomy, Floor 1",
                        currentLecture: "Introduction to Human Anatomy",
                        cohort: "MBBS 2022/2023 Cohort",
                        lecturer: "Mrs. A.T.Weerasinghe",
                        isOccupied: true,
                        imageName: "anatomy_hall",
                        status: "Occupied",
                        statusColor: occupiedColor,
                        nextClass: nil
                    )
                    
                    LectureHallCard(
                        name: "Law Lecture Room2",
                        building: "338- Law, Floor 1",
                        currentLecture: nil,
                        cohort: nil,
                        lecturer: nil,
                        isOccupied: false,
                        imageName: "law_hall",
                        status: "Scheduled",
                        statusColor: scheduledColor,
                        nextClass: "Next Class at 2.00 PM"
                    )
                    
                    // maybe add more halls later
                    LectureHallCard(
                        name: "Engineering Lecture Hall A",
                        building: "330 - Engineering, Floor 2",
                        currentLecture: nil,
                        cohort: nil,
                        lecturer: nil,
                        isOccupied: false,
                        imageName: "engineering_hall",
                        status: "Free",
                        statusColor: freeColor,
                        nextClass: "Available until 4.00 PM"
                    )
                    
                    // additional hall for testing
                    // LectureHallCard(...)
                }
                .padding(.top, 10)
                .padding(.bottom, 120) // space for bottom nav
            }
            
            Spacer()
            
            // bottom navigation
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

struct LectureHallCard: View {
    let name: String
    let building: String
    let currentLecture: String?
    let cohort: String?
    let lecturer: String?
    let isOccupied: Bool
    let imageName: String
    let status: String
    let statusColor: Color
    let nextClass: String?
    
    var body: some View {
        VStack(spacing: 0) {
            
            // image section with status overlay
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 140)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                    .overlay(
                        Group {
                            if imageName == "anatomy_hall" {
                                // try to load anatomy hall image
                                if let anatomyImage = UIImage(named: "AnatomyLectureRoom.jpg") {
                                    Image(uiImage: anatomyImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    // fallback for anatomy hall
                                    ZStack {
                                        Color.gray.opacity(0.3)
                                        VStack {
                                            Image(systemName: "person.3")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Anatomy Hall")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else if imageName == "law_hall" {
                                if let lawHallImage = UIImage(named: "LawLectureRoom.jpg") {
                                    Image(uiImage: lawHallImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    // fallback for law hall
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "building.columns")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Law Hall")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else if imageName == "engineering_hall" {
                                // engineering hall image
                                if let engImage = UIImage(named: "EngineeringLectureHall.jpg") {
                                    Image(uiImage: engImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    // fallback for engineering
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "gearshape.2")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Engineering Hall")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else {
                                // generic fallback image
                                ZStack {
                                    Color.gray.opacity(0.3)
                                    Image(systemName: "building.2")
                                        .font(.system(size: 30))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    )
                
                // status badge in top right
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
            
            // content section
            VStack(alignment: .leading, spacing: 12) {
                
                // hall name and building
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 8) {
                        Image(systemName: "location")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text(building)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.bottom, 20)
                    
                }
                
                // current lecture info or next class info
                if let lecture = currentLecture {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 14) {
                            Image(systemName: "book.closed")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            Text(lecture)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.black)
                        }
                        
                        if let cohortText = cohort {
                            HStack(spacing: 8) {
                                Image(systemName: "person.2")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                Text(cohortText)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        if let lecturerName = lecturer {
                            HStack(spacing: 14) {
                                Image(systemName: "person.circle")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("Lecturer - \(lecturerName)")
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                } else {
                    // when no current lecture
                    if status == "Scheduled" {
                        HStack(spacing: 8) {
                            Image(systemName: "calendar.badge.clock")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            Text("No Ongoing Lectures")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.black)
                        }
                    } else {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            Text("Hall Available")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.black)
                        }
                    }
                }
                
                // next class info
                if let nextClassInfo = nextClass {
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        Text(nextClassInfo)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                // action buttons at bottom
                HStack(spacing: 12) {
                    Spacer()
                    
                    // view button with location icon
                    Button(action: {
                        // TODO: navigate to hall details or map view
                        // print("view button tapped for \(name)")
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: "location")
                                .font(.system(size: 12))
                            Text("View")
                                .font(.system(size: 14, weight: .medium))
                        }
                        .foregroundColor(.white)
//                        .padding(.horizontal, 20)
//                        .padding(.vertical, 12)
//                        .background(Color.black)
//                        .cornerRadius(25)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.black)
                        .cornerRadius(25)
                    }
                    
                    Spacer()
                }
            }
            .padding(20)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}


struct CampusLectureHallsView_Previews: PreviewProvider {
    static var previews: some View {
        CampusLectureHallsView()
    }
}
