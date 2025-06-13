//
//  ReidLibrary.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-09.
//
//DONE

import SwiftUI
import CoreLocation

struct ReidLibrary: View {
    //@State private var selectedTab = "Library"
    @Environment(\.dismiss) private var dismiss

    let reidLibraryLocation = CampusLocation(
        name: "Reid Library",
        category: .library,
        coordinate: CLLocationCoordinate2D(latitude: -31.9790, longitude: 115.8175),
        description: "Main university library"
    )
    
    let pastelGreen = Color(red: 0.6, green: 0.85, blue: 0.7)
    let pastelRed = Color(red: 1.0, green: 0.7, blue: 0.7)
    let pastelOrange = Color(red: 1.0, green: 0.8, blue: 0.6)

    var body: some View {
        VStack(spacing: 0) {
            // header
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                }

                Spacer()

                Text("Reid Library")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.clear)
            }
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)

            ScrollView {
                VStack(spacing: 25) {

                    VStack(spacing: 0) {

                        ZStack {
                            if let libraryImg = UIImage(named: "library-488690.jpg") {
                                Image(uiImage: libraryImg)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 120)
                                    .clipped()
                            } else {
                                Text("Image not found")
                            }
//
//                            .frame(height: 120)
//                            .clipped()

                            VStack {
                                HStack {
                                    Spacer()
                                    Text("Open")
                                        .font(
                                            .system(size: 12, weight: .medium)
                                        )
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.green)
                                        .cornerRadius(12)
                                }
                                Spacer()
                            }
                            .padding(12)
                        }

                        VStack(alignment: .leading, spacing: 12) {

                            HStack(spacing: 20) {
                                HStack(spacing: 8) {
                                    Image(systemName: "clock")
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)

                                    Text("Open: 7:30am-8:30pm")
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                HStack(spacing: 8) {
                                    Image(systemName: "location")
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)

                                    Text("139 Building")
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)
                                }
                            }

                  
                            Text("Availability")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)

                            
                   
                            HStack(spacing: 0) {
                                // pcs available
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("PCs Available:")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)

                                    HStack(spacing: 4) {
                                        Text("2")
                                            .font(
                                                .system(size: 20, weight: .bold)
                                            )
                                            .foregroundColor(.black)

                                        Text("/50")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                    }

                                    // progress bar for pcs
                                    ProgressView(value: 2, total: 50)
                                        .progressViewStyle(
                                            LinearProgressViewStyle(
                                                tint: .orange)
                                        )
                                        .frame(width: 120, height: 8)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(4)
                                }

                                Spacer()

                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 1, height: 60)

                                Spacer()

                                // seats available
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Seats Available:")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)

                                    HStack(spacing: 4) {
                                        Text("10")
                                            .font(
                                                .system(size: 20, weight: .bold)
                                            )
                                            .foregroundColor(.black)

                                        Text("/100")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                    }

                                    // progress bar for seats
                                    ProgressView(value: 39, total: 100)
                                        .progressViewStyle(
                                            LinearProgressViewStyle(
                                                tint: .orange)
                                        )
                                        .frame(width: 120, height: 8)
                                        .background(Color.gray.opacity(0.3))
                                        .cornerRadius(4)
                                }
                            }
                            .padding(.bottom, 8)
                        }
                        .padding(16)
                        .background(Color.white)
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)

                    HStack(alignment: .top, spacing: 30) {

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Facilities")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)

                            VStack(spacing: 15) {
                                LibraryFacilityCard(
                                    icon: "doc.viewfinder", title: "Scanning",
                                    color: .blue)
                                LibraryFacilityCard(
                                    icon: "printer", title: "Printouts",
                                    color: .blue)
                                LibraryFacilityCard(
                                    icon: "square.on.square",
                                    title: "Photocopy", color: .blue)
                            }
                            .padding(.horizontal, 10)
                        }

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Resources")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)

                            VStack(spacing: 15) {
                                LibraryFacilityCard(
                                    icon: "wifi", title: "Wi-Fi", color: .blue)
                                LibraryFacilityCard(
                                    icon: "printer.fill", title: "Printers",
                                    color: .blue)
                                LibraryFacilityCard(
                                    icon: "bolt", title: "Power Outlets",
                                    color: .blue)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding()

                    NavigationLink(destination: MapView(targetLocation: reidLibraryLocation)) {
                        Text("Get Directions")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.black)
                            .cornerRadius(20)
                    }                    .padding(.horizontal, 100)
                    .padding(.bottom, 20)
                    .padding(.top, 0)
                }
                .padding(.bottom, 100)
            }

            Spacer()

//            BottomNavigationBar(selectedTab: selectedTab) { tab in
//                selectedTab = tab
//
//            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}



struct ReidLibrary_Previews: PreviewProvider {
    static var previews: some View {
        ReidLibrary()
    }
}
