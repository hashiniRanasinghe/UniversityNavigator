//
//  CampusLibrariesView.swift
//  UniversityNavigator
//
//  Created by Developer on 2025-06-07.
//

import SwiftUI

struct CampusLibrariesView: View {
    @State private var selectedTab = "Places"
    @State private var selectedCategory = "All Libraries"
    
    let categories = ["All Libraries", "Open Now", "PC Available"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        // TODO: Navigate back
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                    
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
                VStack(spacing: 20) {
                    // Category Filters
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
                                        .background(selectedCategory == category ? (category == "All Libraries" ? Color.black : Color.black) : Color.clear)
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
                    
                    // Libraries List
                    VStack(spacing: 15) {
                        LibraryCard(
                            name: "Barry J Marshall Library",
                            building: "446 Building",
                            hours: "7.30am-8.30pm",
                            pcsAvailable: 26,
                            totalPcs: 60,
                            seatsAvailable: 39,
                            totalSeats: 100,
                            isOpen: true,
                            imageName: "barry_library"
                        )
                        
                        LibraryCard(
                            name: "Reid Library",
                            building: "139 Building",
                            hours: "7.30am-8.30pm",
                            pcsAvailable: 25,
                            totalPcs: 50,
                            seatsAvailable: 30,
                            totalSeats: 100,
                            isOpen: true,
                            imageName: "reid_library"
                        )
                        
                        LibraryCard(
                            name: "Beasley Law Library",
                            building: "338 - Law, Floor G",
                            hours: "7.30am-8.30pm",
                            pcsAvailable: 15,
                            totalPcs: 30,
                            seatsAvailable: 45,
                            totalSeats: 80,
                            isOpen: true,
                            imageName: "law_library"
                        )
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 120)
            }
            
            Spacer()
            
            // Bottom Navigation Bar
            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}




struct LibraryCard: View {
    let name: String
    let building: String
    let hours: String
    let pcsAvailable: Int
    let totalPcs: Int
    let seatsAvailable: Int
    let totalSeats: Int
    let isOpen: Bool
    let imageName: String
    
    // Extract complex image logic to fix compiler type-checking issue
    private var libraryImageView: some View {
        Group {
            if imageName == "barry_library" {
                if let barryImage = UIImage(named: "library1.jpg") {
                    Image(uiImage: barryImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .clipShape(UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8))
                } else {
                    Image(systemName: "building.2")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                        .frame(height: 120)
                }
            } else if imageName == "reid_library" {
                if let reidImage = UIImage(named: "library2.png") {
                    Image(uiImage: reidImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                } else {
                    Image(systemName: "books.vertical")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                        .frame(height: 120)
                }
            } else if imageName == "law_library" {
                if let lawImage = UIImage(named: "library3.jpg") {
                    Image(uiImage: lawImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                } else {
                    Image(systemName: "scale.3d")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                        .frame(height: 120)
                }
            } else {
                Image(systemName: "building.columns")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                    .frame(height: 120)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Header Image Section - Updated to match fitness centre
            ZStack(alignment: .topTrailing) {
                Rectangle()
                    .fill(Color.gray.opacity(0.7))
                    .frame(height: 120)
                    .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                    .overlay(
                        libraryImageView
                            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 12, topTrailingRadius: 12))
                    )
                
                // Open Status Badge
                Text(isOpen ? "Open" : "Closed")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(isOpen ? Color.green : Color.red)
                    .cornerRadius(8)
                    .padding(.top, 8)
                    .padding(.trailing, 8)
            }
            
            // Content Section - Updated structure to match fitness centre
            VStack(alignment: .leading, spacing: 10) {
                
                // Title and Status - Updated to match fitness centre layout
                HStack {
                    Text(name)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(isOpen ? "Open" : "Closed")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(isOpen ? Color.green : Color.red)
                        .cornerRadius(12)
                }
                
                // Hours - Updated to match fitness centre
                HStack(spacing: 20) {
                    HStack(spacing: 8) {
                        Image(systemName: "clock")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Text("Open: \(hours)")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                }
                
                // PC Availability 
                HStack(spacing: 20) {
                    HStack(spacing: 8) {
                        Image(systemName: "location")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        
                        Text(building)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 8) {
                        Text("Available PCs")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 4) {
                            Text("\(pcsAvailable)")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text("/\(totalPcs)")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        // Progress Bar for PCs
                        ProgressView(value: Double(pcsAvailable), total: Double(totalPcs))
                            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                            .frame(width: 80, height: 7)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(2)
                    }
                }
                
                // Study Seats Section - New section to match fitness centre structure
                HStack(spacing: 20) {
                    HStack(spacing: 6) {
                                            Image(systemName: "map")
                                                .font(.system(size: 10))
                                                .foregroundColor(.gray)
                                            
                                            Button(action: {
                                                // TODO: Navigate to library details or map
                                            }) {
                                                Text("View")
                                                    .font(.system(size: 10, weight: .medium))
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal, 12)
                                                    .padding(.vertical, 6)
                                                    .background(Color.black)
                                                    .cornerRadius(12)
                                            }
                                        }
                                        
                                        Spacer()
                    
                    VStack(alignment: .trailing, spacing: 6) {
                        Text("Available Seats")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 4) {
                            Text("\(seatsAvailable)")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                            
                            Text("/\(totalSeats)")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        
                        // Progress Bar for Seats
                        ProgressView(value: Double(seatsAvailable), total: Double(totalSeats))
                            .progressViewStyle(LinearProgressViewStyle(tint: .green))
                            .frame(width: 80, height: 7)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(2)
                    }
                }
                
          
            }
            .padding(16) // Updated padding to match fitness centre
            .background(Color.white)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal, 1) // Add horizontal padding like fitness centre
        .padding(.bottom, 5) // Add bottom padding like fitness centre
    }
}

struct CampusLibrariesView_Previews: PreviewProvider {
    static var previews: some View {
        CampusLibrariesView()
    }
}
