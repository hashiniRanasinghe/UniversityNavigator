
//
//  CampusCafeteriasView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-08.
//

//DONE -HASHINI
import SwiftUI
import CoreLocation

struct CampusCafeteriasView: View {
    //@State private var selectedTab = "Cafe"
    @State private var selectedCategory = "All Cafes"
    @Environment(\.dismiss) private var dismiss
    
    let ezoneLocation = CampusLocation(
        name: "Ezone Cafe",
            category: .cafeteria,
        coordinate: CLLocationCoordinate2D(latitude: -31.9805, longitude: 115.8185),
        description: "Ezone North cafe and dining area"
    )

    let hackettLocation = CampusLocation(
        name: "Hackett Cafe",
        category: .cafeteria,
        coordinate: CLLocationCoordinate2D(latitude: -31.9795, longitude: 115.8180),
        description: "Main campus cafe and dining area"
    )

    let businessLocation = CampusLocation(
        name: "Business School Cafe",
        category: .cafeteria,
        coordinate: CLLocationCoordinate2D(latitude: -31.9785, longitude: 115.8175),
        description: "Business School cafe and dining area"
    )
    
    let categories = ["All Cafes", "Open Now", "Less Crowded"]
    
    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let moderateColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
    let busyColor = Color(red: 0.9, green: 0.4, blue: 0.4)     // soft red
    
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
                    
                    Text("Campus Cafeterias")
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
                    
                    //cafe cards
                    VStack(alignment: .leading, spacing: 15) {
                        
                        CafeteriaCard(
                            name: "Ezone Cafe",
                            building: "222- Ezone North, Floor G",
                            hours: "7.30am-8.30pm",
                            waitingTime: "~4Mins",
                            crowdLevel: "Busy",
                            crowdColor: busyColor,
                            isOpen: true,
                            imageName: "ezone_cafe",
                            location: ezoneLocation
                        )

                        CafeteriaCard(
                            name: "Hackett Cafe",
                            building: "103 - Hackett hall, Floor G",
                            hours: "7.30am-8.30pm",
                            waitingTime: "~0Mins",
                            crowdLevel: "Free",
                            crowdColor: freeColor,
                            isOpen: true,
                            imageName: "hackett_cafe",
                            location: hackettLocation
                        )

                        CafeteriaCard(
                            name: "Business School Cafe",
                            building: "Business School, Floor 1",
                            hours: "7.30am-8.30pm",
                            waitingTime: "~16Mins",
                            crowdLevel: "Busy",
                            crowdColor: busyColor,
                            isOpen: true,
                            imageName: "business_cafe",
                            location: businessLocation
                        )
                    }
                }
                .padding(.bottom, 120)
            }
            
            Spacer()
            

//            BottomNavigationBar(selectedTab: selectedTab) { tab in
//                selectedTab = tab
//                switch tab {
//                case "Home":
//            
//                    break
//                case "Map":
//
//                    break
//                case "Library":
//             
//                    break
//                case "Cafe":
//         
//                    break
//                case "Halls":
//      
//                    break
//                case "Gym":
//        
//                    break
//                case "Parking":
//             
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
}

struct CafeteriaCard: View {
    let name: String
    let building: String
    let hours: String
    let waitingTime: String
    let crowdLevel: String
    let crowdColor: Color
    let isOpen: Bool
    let imageName: String
    let location: CampusLocation
    
    private var destinationView: some View {
        Group {
            switch name {
            case "Ezone Cafe":
                CanteenMenuEzoneCafeView()
            case "Hackett Cafe":
                CanteenMenuHackettCafeView()
            case "Business School Cafe":
                CanteenMenuBusinessSchoolCafeView()
            default:
                Text("Menu not available")
            }
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
                            
                            if imageName == "ezone_cafe" {
                                if let ezoneImage = UIImage(named: "cafe1ezone.png") {
                                    Image(uiImage: ezoneImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    
                                    ZStack {
                                        Color.gray.opacity(0.3)
                                        VStack {
                                            Image(systemName: "cup.and.saucer")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Ezone Cafe")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else if imageName == "hackett_cafe" {
                                if let hackettImage = UIImage(named: "hackettcafe2.jpg") {
                                    Image(uiImage: hackettImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                        
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "fork.knife")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else if imageName == "business_cafe" {
                                if let businessImage = UIImage(named: "businesscafe3.jpg") {
                                    Image(uiImage: businessImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                                    //business cafe
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "briefcase")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Business Cafe")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            } else {
                                
                                ZStack {
                                    Color.gray.opacity(0.3)
                                    Image(systemName: "storefront")
                                        .font(.system(size: 30))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    )
                
                // open/closed
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
            
                VStack(alignment: .leading, spacing: 12) {
                
                // cafe name
                HStack {
                    Text(name)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                
                VStack(spacing: 6) {
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text(hours)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Est.Waiting")
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                            
                            Text(waitingTime)
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.black)
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
                        
                        VStack(alignment: .trailing, spacing: 2) {
                            Text("Crowd Level")
                                .font(.system(size: 10))
                                .foregroundColor(.gray)
                            
                            Text(crowdLevel)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 2)
                                .background(crowdColor)
                                .cornerRadius(6)
                        }
                    }
                }
               
                HStack(spacing: 12) {
                    Spacer()
                    
                        NavigationLink(destination: MapView(targetLocation: location)) {
                        Text("Get Directions")
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
            .padding(20)
        }
        
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 20)
    }
}


struct CampusCafeteriasView_Previews: PreviewProvider {
    static var previews: some View {
        CampusCafeteriasView()
    }
}
