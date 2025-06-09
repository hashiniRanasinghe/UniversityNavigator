
//
//  CampusResourcesView.swift
//  UniversityNavigator
//
//  Created by Developer on 2025-06-08.
//

import SwiftUI

struct CampusResourcesView: View {
    @State private var selectedTab = "Places"
    @Environment(\.dismiss) private var dismiss
    
    // status colors
    let freeColor = Color(red: 0.3, green: 0.8, blue: 0.5)     // soft green
    let moderateColor = Color(red: 1.0, green: 0.7, blue: 0.3) // soft orange
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
                    
                        Text("Campus Resources")
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
                    //program office
                        VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Program Office")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                            .padding(.horizontal, 20)
                        
                        ResourceCard(
                            imageName: "program_office",
                            status: "Open",
                            statusColor: Color.green,
                            weekdayHours: "7.30am-8.30pm",
                            location: "Building G, Ground Floor",
                            email: "pgoffice@crawley.com",
                            phone: "0491 920 357",
                            availabilityStatus: "Free",
                            availabilityColor: freeColor
                        )
                    }
                    
                    //administration office
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Administration Office")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                    .padding(.horizontal, 20)
                        
                        ResourceCard(
                            imageName: "admin_office",
                            status: "Open",
                            statusColor: Color.green,
                            weekdayHours: "7.30am-8.30pm",
                            location: "Building B, Ground Floor",
                            email: "pgoffice@crawley.com",
                            phone: "0491 570 159",
                            availabilityStatus: "Free",
                            availabilityColor: freeColor
                        )
                    }
                }
                .padding(.bottom, 120)
            }
            Spacer()
            

            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}

struct ResourceCard: View {
    let imageName: String
    let status: String
    let statusColor: Color
    let weekdayHours: String
    let location: String
    let email: String
    let phone: String
    let availabilityStatus: String
    let availabilityColor: Color
    
    var body: some View {
        VStack(spacing: 0) {

            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 140)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))

                
                    .overlay(
                            Group {
                            if imageName == "program_office" {
                                if let programOfficeImage = UIImage(named: "program-office.jpg") {
                                    Image(uiImage: programOfficeImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                } else {
                              
                                    ZStack {
                                        Color.gray.opacity(0.3)
                                        VStack {
                                            Image(systemName: "building.2.fill")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Program Office")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                                
                            } else if imageName == "admin_office" {
                                if let adminOfficeImage = UIImage(named: "admin-office.jpg") {
                                    Image(uiImage: adminOfficeImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 140)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                                    
                                } else {
                                    
                                    
                                    ZStack {
                                        Color.gray.opacity(0.4)
                                        VStack {
                                            Image(systemName: "person.2.fill")
                                                .font(.system(size: 30))
                                                .foregroundColor(.gray)
                                            Text("Admin Office")
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
                //hours
                HStack(spacing: 8) {
                    Image(systemName: "clock")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text("Open (weekdays): \(weekdayHours)")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // availability
                    Text(availabilityStatus)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(availabilityColor)
                        .cornerRadius(8)
                }
                
                // location
                HStack(spacing: 8) {
                    Image(systemName: "location")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text(location)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
                //email
                HStack(spacing: 8) {
                    Image(systemName: "envelope")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text(email)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
          
                
                
                HStack(alignment: .bottom) {
                    HStack(spacing: 8) {
                        Image(systemName: "phone")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text(phone)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                   
                    Button(action: {
                        // TODO: Navigate to directions
                    }) {
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


struct CampusResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        CampusResourcesView()
    }
}
