//
//  HomePageView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-04.
//

import SwiftUI

struct HomePageView: View {
    @State private var searchText = ""
    @State private var selectedTab = "Home"
    
    var body: some View {
        VStack(spacing: 0) {
    
            VStack(spacing: 20) {
                Text("Campus Navigator")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
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

                    HStack(spacing: 0) {
                        CategoryButton(icon: "book", title:
                                        "Library", color: .blue)
                        CategoryButton(icon: "cup.and.saucer",
                                       title: "Cafe", color: .blue)
                        CategoryButton(icon: "building.2", title: "Halls", color: .blue)
                        CategoryButton(icon: "dumbbell", title: "Gym", color: .blue)
                    }
                    .padding(.horizontal, 20)
                    
                    // Open Now Section
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Open Now")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                LocationCard(
                                    title: "Reid Library",
                                    status: "Busy",
                                    statusColor: .red,
                                    spotsAvailable: "10/100 Spots Available",
                                    imageName: "library"
                                )
                                
                                LocationCard(
                                    title: "Fitness Centre",
                                    status: "Free",
                                    statusColor: .green,
                                    spotsAvailable: "27/50 Spots Available",
                                    imageName: "gym"
                                )
                                
                                LocationCard(
                                    title: "Ezora",
                                    status: "Moderate",
                                    statusColor: .orange,
                                    spotsAvailable: "15/30 Spots Available",
                                    imageName: "cafe"
                                )
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    
                    // Quick Directions Section
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
                                QuickDirectionCard(title: "Student Hub", imageName: "student")
                                QuickDirectionCard(title: "Food Court", imageName: "food")
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.bottom, 100)
            }
            
            Spacer()
            
            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
                // Navigate or handle tab switch here
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

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
            // Image placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 200, height: 120)
                .cornerRadius(12, corners: [.topLeft, .topRight])
                .overlay(
                    Image(systemName: imageName == "library" ? "books.vertical.fill" :
                         imageName == "gym" ? "dumbbell.fill" : "cup.and.saucer.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
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
        VStack(spacing: 0) {
            // Image placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 80)
                .cornerRadius(8, corners: [.topLeft, .topRight])
                .overlay(
                    Image(systemName: imageName == "library" ? "books.vertical.fill" :
                         imageName == "office" ? "building.2.fill" :
                         imageName == "student" ? "person.2.fill" : "fork.knife")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                )
            
            VStack(spacing: 8) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Button(action: {}) {
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

// Helper extension for corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
