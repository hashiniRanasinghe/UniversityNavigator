//
//  MapView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-08.
//

import SwiftUI

struct MapView: View {
    @State private var selectedTab = "Map"
    @State private var currentScale: CGFloat = 1.0
    @State private var finalScale: CGFloat = 1.0
    @State private var currentOffset = CGSize.zero
    @State private var finalOffset = CGSize.zero
    
    // navigation states - maybe we'll use these later
    @State private var showFromField = false
    @State private var showToField = false
    @State private var navigateFrom = ""
    @State private var navigateTo = ""
    
    // some extra vars that might be useful later
    // @State private var isNavigating = false
    // @State private var routePath: [CGPoint] = []
    
    var body: some View {
        VStack(spacing: 0) {
            
            // header section
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        // go back action - maybe implement later
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                    
                    Text("Campus Map")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                .padding(.bottom, 15)
            }
            .background(Color.white)
            
            // map container
            ZStack {
                // main map image with zoom and pan
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    ZStack {
                        // the actual map image
                        Group {
                            if let mapImage = UIImage(named: "campus-map.png") {
                                Image(uiImage: mapImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    // .frame(width: 800, height: 600) // might need to adjust this
                            } else {
                                // fallback if image not found
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(width: 800, height: 600)
                                    .overlay(
                                        Text("Campus Map\nImage Not Found")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.gray)
                                    )
                            }
                        }
                        .scaleEffect(currentScale)
                        .offset(currentOffset)
                        .gesture(
                            SimultaneousGesture(
                                // zoom gesture
                                MagnificationGesture()
                                    .onChanged { value in
                                        let delta = value / finalScale
                                        currentScale = finalScale * delta
                                        // limit zoom levels
                                        if currentScale < 0.5 {
                                            currentScale = 0.5
                                        } else if currentScale > 3.0 {
                                            currentScale = 3.0
                                        }
                                    }
                                    .onEnded { value in
                                        finalScale = currentScale
                                    },
                                
                                // drag gesture for panning
                                DragGesture()
                                    .onChanged { value in
                                        currentOffset = CGSize(
                                            width: finalOffset.width + value.translation.width,
                                            height: finalOffset.height + value.translation.height
                                        )
                                    }
                                    .onEnded { value in
                                        finalOffset = currentOffset
                                    }
                            )
                        )
                        
                        // maybe add some location pins later
                        // LocationPin(position: CGPoint(x: 100, y: 200), title: "Library")
                        // LocationPin(position: CGPoint(x: 300, y: 150), title: "Cafe")
                        
                    }
                }
                .clipped() // keep the map within bounds
                
                // zoom controls overlay
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(spacing: 8) {
                            // zoom in button
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    if currentScale < 3.0 {
                                        currentScale += 0.3
                                        finalScale = currentScale
                                    }
                                }
                            }) {
                                Image(systemName: "plus")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                    .frame(width: 44, height: 44)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                            }
                            
                            // zoom out button
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    if currentScale > 0.5 {
                                        currentScale -= 0.3
                                        finalScale = currentScale
                                    }
                                }
                            }) {
                                Image(systemName: "minus")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                    .frame(width: 44, height: 44)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                            }
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 200) // adjust based on navigation section height
                    }
                }
            }
            
            // navigation section at bottom
            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 1)
                
                VStack(spacing: 16) {
                    // navigate from section
                    HStack(spacing: 12) {
                        Image(systemName: "map")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 24)
                        
                        Text("Navigate From")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        // this should be like google maps search field
                        Button(action: {
                            showFromField.toggle()
                        }) {
                            HStack {
                                if navigateFrom.isEmpty {
                                    Text("Current Location")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                } else {
                                    Text(navigateFrom)
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .frame(maxWidth: 200)
                        }
                    }
                    
                    // navigate to section
                    HStack(spacing: 12) {
                        Image(systemName: "location")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .frame(width: 24)
                        
                        Text("Navigate To")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {
                            showToField.toggle()
                        }) {
                            HStack {
                                if navigateTo.isEmpty {
                                    Text("Choose destination")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                } else {
                                    Text(navigateTo)
                                        .font(.system(size: 14))
                                        .foregroundColor(.black)
                                }
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .frame(maxWidth: 200)
                        }
                    }
                    
                    // get directions button
                    Button(action: {
                        // implement direction logic here
                        print("Getting directions from \(navigateFrom) to \(navigateTo)")
                    }) {
                        Text("Get Directions")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal, 20)
                    .disabled(navigateTo.isEmpty) // disable if no destination selected
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .background(Color.white)
            }
            
            // bottom navigation
            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
                // handle tab changes here
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
        // .sheet(isPresented: $showFromField) {
        //     LocationSearchSheet(selectedLocation: $navigateFrom, title: "Navigate From")
        // }
        // .sheet(isPresented: $showToField) {
        //     LocationSearchSheet(selectedLocation: $navigateTo, title: "Navigate To")
        // }
    }
}

// location pin component - might use later
struct LocationPin: View {
    let position: CGPoint
    let title: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 24))
                .foregroundColor(.red)
            
            Text(title)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.black)
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(Color.white.opacity(0.9))
                .cornerRadius(4)
        }
        .position(position)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
