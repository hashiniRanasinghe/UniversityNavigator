//
//  AnatomyLectureRoomView.swift
//  UniversityNavigator
//
//  Created by Kuluni 005  on 2025-06-11.
//

import SwiftUI
import CoreLocation

struct AnatomyLectureRoomView: View {
    @State private var selectedTab = "Halls"
    @Environment(\.dismiss) private var dismiss
    

    let location = CampusLocation(
        name: "Anatomy Lecture Room 181",
        category: .library,
        coordinate: CLLocationCoordinate2D(latitude: -31.9795, longitude: 115.8170),
        description: "Main university library"
    )
    
    
    private let hallName = "Anatomy Lecture Room 181"
    private let building = "344 - Anatomy, Floor 1"
    private let seats = 75
    private let imageName = "AnatomyLectureRoom"
    

    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let scheduledColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    let occupiedColor = Color(red: 0.9, green: 0.4, blue: 0.4) // soft red
    
    var body: some View {
        VStack(spacing: 0) {
 
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
                    

                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Availability Schedule")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        VStack(spacing: 12) {
                            ScheduleItem(
                                time: "9.00 - 11.00",
                                title: "Introduction to Human Anatomy",
                                lecturer: "Mrs. A.T.Weerasinghe",
                                status: "Occupied",
                                statusColor: occupiedColor
                            )
                            
                            //Divider()
                               // .background(Color.gray.opacity(0.3))
                            
                            ScheduleItem(
                                time: "11.30 - 13.30",
                                title: "Anatomy of the Human Body",
                                lecturer: "Mr. D.M.Herath",
                                status: "Scheduled",
                                statusColor: scheduledColor
                            )
                            
//                            Divider()
//                                .background(Color.gray.opacity(0.3))
                            
                            ScheduleItem(
                                time: "14.30 - 16.30",
                                title: nil,
                                lecturer: nil,
                                status: "Free",
                                statusColor: freeColor
                            )
                        }
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        .padding(.horizontal, 20)
                    }
                    
              
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
                    NavigationLink(destination: MapView(targetLocation: location)) {
                        Text("Get Directions")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 40)
                            .background(Color.black)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 60)                    .padding(.bottom, 20)
                    .padding(.top, 0)
                }
            }
            
            Spacer()
            
        }

        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }

}

struct ScheduleItem: View {
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
                .cornerRadius(6)
        }
        .padding(.vertical, 8)
    }
}

struct ResourceItem: View {
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
        .cornerRadius(12)
    }
}



struct AnatomyLectureRoomViewPreviews: PreviewProvider {
    static var previews: some View {
        AnatomyLectureRoomView()
    }
}
