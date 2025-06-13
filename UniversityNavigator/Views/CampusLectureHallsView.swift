//
//  CampusLectureHallsView.swift
//  UniversityNavigator
//
//  Created by Developer on 2025-06-07.
//

//import SwiftUI
//
import SwiftUI
import CoreLocation


struct CampusLectureHallsView: View {
    @State private var selectedTab = "Halls"
    @State private var selectedCategory = "All Lecture Halls"
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    
    let categories = ["All Lecture Halls", "Occupied", "Free"]
    
    
    let lectureHallLocations: [CampusLocation] = [
        CampusLocation(name: "Anatomy Lecture Room 181", category: .lectureHall,
                      coordinate: CLLocationCoordinate2D(latitude: -31.9785, longitude: 115.8170),
                      description: "Anatomy Lecture Room 181 - 344 Building"),
        CampusLocation(name: "Law Lecture Room2", category: .lectureHall,
                      coordinate: CLLocationCoordinate2D(latitude: -31.9780, longitude: 115.8160),
                      description: "Law Lecture Room2 - 338 Law Building"),
        CampusLocation(name: "Engineering Lecture Hall A", category: .lectureHall,
                      coordinate: CLLocationCoordinate2D(latitude: -31.9800, longitude: 115.8185),
                      description: "Engineering Lecture Hall A - 330 Building")
    ]

    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let scheduledColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    let occupiedColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red

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
                    Text("Campus Lecture Halls")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            

            
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
                
                //filters
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
                        nextClass: nil,
                        targetLocation: lectureHallLocations.first { $0.name == "Anatomy Lecture Room 181" }
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
                        nextClass: "Next Class at 2.00 PM",
                        targetLocation: lectureHallLocations.first { $0.name == "Law Lecture Room2" }
                    )
                    
                    
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
                        nextClass: "Available until 4.00 PM",
                        targetLocation: lectureHallLocations.first { $0.name == "Engineering Lecture Hall A" }
                    )
                    
                    
                }
                .padding(.top, 10)
                .padding(.bottom, 120) }
            
            Spacer()
            
            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
                
              
                switch tab {
                case "Home":
         
                    break
                case "Map":
          
                    break
                case "Library":

                    break
                case "Cafe":
                 
                    break
                case "Halls":
    
                    break
                case "Gym":
     
                    break
                case "Parking":
           
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
    let targetLocation: CampusLocation?
    

    private var destinationView: some View {
        switch name {
        case "Anatomy Lecture Room 181":
            return AnyView(AnatomyLectureRoomView())
        case "Law Lecture Room2":
            return AnyView(LawLectureRoomView())
        default:
            return AnyView(EmptyView())
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            

            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 140)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                    .overlay(
                        Group {
                            if imageName == "anatomy_hall" {
            
                                if let anatomyImage = UIImage(named: "AnatomyLectureRoom.jpg") {
                                    Image(uiImage: anatomyImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                               
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
                                // engineering hall
                                if let engImage = UIImage(named: "EngineeringLectureHall.jpg") {
                                    Image(uiImage: engImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
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
                                ZStack {
                                    Color.gray.opacity(0.3)
                                    Image(systemName: "building.2")
                                        .font(.system(size: 30))
                                        .foregroundColor(.gray)
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
            Spacer()
            
            // content
            VStack(alignment: .leading, spacing: 12) {
                
       
            
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
                
                //next classes
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
                
                HStack(spacing: 12) {
                      Spacer()
                      
                      NavigationLink(destination: MapView(targetLocation: targetLocation)) {
                          Text("Directions")
                              .font(.system(size: 14, weight: .medium))
                              .foregroundColor(.white)
                              .padding(.horizontal, 20)
                              .padding(.vertical, 12)
                              .background(Color.black)
                              .cornerRadius(25)
                      }
                      
                      NavigationLink(destination: destinationView) {
                          Text("View Details")
                              .font(.system(size: 14, weight: .medium))
                              .foregroundColor(.white)
                              .padding(.horizontal, 20)
                              .padding(.vertical, 12)
                              .background(Color.black)
                              .cornerRadius(25)
                      }
                      
                      Spacer()
                  }
              }
            }
            .padding(20)
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
