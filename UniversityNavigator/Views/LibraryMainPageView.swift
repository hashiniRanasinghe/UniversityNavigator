//
//  CampusLibrariesView.swift
//  UniversityNavigator
//
//  Created by Developer on 2025-06-07.
//

//import SwiftUI

//DONE
import SwiftUI
import CoreLocation
struct CampusLibrariesView: View {
    @State private var selectedTab = "Library"
    @State private var selectedCategory = "All Libraries"
    @Environment(\.dismiss) private var dismiss
    @State private var showingMapView = false
    
    let categories = ["All Libraries", "Open Now", "PC Available"]
    
    //colors
    let availableColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let moderateColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    let busyColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red
    
    

    

    let libraryLocations: [CampusLocation] = [
        CampusLocation(name: "Barry J Marshall Library", category: .library,
                      coordinate: CLLocationCoordinate2D(latitude: -31.9785, longitude: 115.8170),
                      description: "Barry J Marshall Library - 446 Building"),
        CampusLocation(name: "Reid Library", category: .library,
                      coordinate: CLLocationCoordinate2D(latitude: -31.9790, longitude: 115.8175),
                      description: "Reid Library - 139 Building"),
        CampusLocation(name: "Beasley Law Library", category: .library,
                      coordinate: CLLocationCoordinate2D(latitude: -31.9780, longitude: 115.8160),
                      description: "Beasley Law Library - 338 Law Building")
    ]
    
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
//
                    Text("Campus Libraries")
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
                    
                    // library section 1
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Main Libraries")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        LibraryCard(
                            name: "Barry J Marshall Library",
                            building: "446 Building",
                            weekdayHours: "7.30am-8.30pm",
                            weekendHours: "8.00am-6.00pm",
                            pcsAvailable: 26,
                            totalPcs: 60,
                            seatsAvailable: 39,
                            totalSeats: 100,
                            isOpen: true,
                            imageName: "barry_library",
                            pcStatus: "Available",
                            pcStatusColor: availableColor,
                            targetLocation: libraryLocations.first { $0.name == "Barry J Marshall Library" }
                        )
                        
                        LibraryCard(
                            name: "Reid Library",
                            building: "139 Building",
                            weekdayHours: "7.30am-8.30pm",
                            weekendHours: "9.00am-8.00pm",
                            pcsAvailable: 25,
                            totalPcs: 50,
                            seatsAvailable: 30,
                            totalSeats: 100,
                            isOpen: true,
                            imageName: "reid_library",
                            pcStatus: "Moderate",
                            pcStatusColor: moderateColor,
                            targetLocation: libraryLocations.first { $0.name == "Reid Library" }
                        )
                    }
                    
                    //libraries section 2
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Specialized Libraries")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                             Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        LibraryCard(
                            name: "Beasley Law Library",
                            building: "338 - Law, Floor G",
                            weekdayHours: "7.30am-8.30pm",
                            weekendHours: "10.00am-6.00pm",
                            pcsAvailable: 15,
                            totalPcs: 30,
                            seatsAvailable: 45,
                            totalSeats: 80,
                            isOpen: true,
                            imageName: "law_library",
                            pcStatus: "Busy",
                            pcStatusColor: busyColor,
                            targetLocation: libraryLocations.first { $0.name == "Beasley Law Library" }
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
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct LibraryCard: View {
    let name: String
    let building: String
    let weekdayHours: String
    let weekendHours: String
    let pcsAvailable: Int
    let totalPcs: Int
    let seatsAvailable: Int
    let totalSeats: Int
    let isOpen: Bool
    let imageName: String
    let pcStatus: String
    let pcStatusColor: Color
    let targetLocation: CampusLocation?
    
    
    private var destinationView: some View {
        switch name {
        case "Barry J Marshall Library":
            return AnyView(BarryJLibraryView())
        case "Reid Library":
            return AnyView(ReidLibrary())
        case "Beasley Law Library":
            return AnyView(BeasleyLibrary())
        default:
            return AnyView(EmptyView())
        }
    }
    
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
                            if imageName == "barry_library" {
                                if let barryImage =
//                                    UIImage(named: "library1.jpg") {
                                    UIImage(named: "library1.jpg") {
                                    Image(uiImage: barryImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                                         .frame(maxWidth: .infinity)
                                                                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                  
                                    ZStack {
                                        Color.gray.opacity(0.3)
                                        VStack {
                                            Image(systemName: "building.2")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Barry Library")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else if imageName == "reid_library" {
                                if let reidImage = UIImage(named: "library-488690.jpg") {
                                    Image(uiImage: reidImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                                         .frame(maxWidth: .infinity)
                                                                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    //fallback for reid library
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "books.vertical")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Reid Library")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else if imageName == "law_library" {
                                if let lawImage = UIImage(named: "library3.jpg") {
                                    Image(uiImage: lawImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                                         .frame(maxWidth: .infinity)
                                                                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    // law library
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "scale.3d")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Law Library")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else {
                                //generic fallback
                                ZStack {
                                    Color.gray.opacity(0.3)
                                    Image(systemName: "building.columns")
                                        .font(.system(size: 30))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    )
                
 
                    Text(isOpen ? "Open" : "Closed")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(isOpen ? Color.green : Color.red)
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
                        
Text(pcStatus)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(pcStatusColor)
                            .cornerRadius(8)
                    }
                }
                
        
            HStack(spacing: 8) {
                    Image(systemName: "location")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text(building)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
     
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(pcsAvailable)/\(totalPcs)")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.black)
                        
                    VStack(alignment: .leading, spacing: 2) {
                            Text("PCs")
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
                                    .fill(pcsAvailable > 0 ? Color.green : Color.red)
                                    .frame(width: geometry.size.width * CGFloat(pcsAvailable) / CGFloat(totalPcs), height: 4)
                                    .cornerRadius(2)
                            }
                        }
                            .frame(height: 4)
                            .frame(maxWidth: 150)
                    }
                    
                    Spacer()
                    
            
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("\(seatsAvailable)/\(totalSeats)")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Seats")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                            Text("Available")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
          
                HStack(spacing: 12) {
                    Spacer()
                    
//                    NavigationLink(destination: MapView(targetLocation: targetLocation)) {
//                        Text("Directions")
//                            .font(.system(size: 14, weight: .medium))
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 20)
//                            .padding(.vertical, 12)
//                            .background(Color.black)
//                            .cornerRadius(25)
//                    }
                    
                  
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
            .padding(20)
            
            
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}




struct CampusLibrariesView_Previews: PreviewProvider {
    static var previews: some View {
        CampusLibrariesView()
    }
}
