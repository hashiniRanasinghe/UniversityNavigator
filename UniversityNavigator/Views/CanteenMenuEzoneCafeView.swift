//
//  CanteenMenuView.swift
//  UniversityNavigator
//
//  Created by Kuluni 005 on 2025-06-07.
//

import CoreLocation
import SwiftUI

struct CanteenMenuEzoneCafeView: View {
    //@State private var selectedTab = "Cafe"
    @State private var selectedCategory = "All Foods"
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss

    let ezoneLocation = CampusLocation(
        name: "Ezone Cafe",
        category: .cafeteria,
        coordinate: CLLocationCoordinate2D(
            latitude: -31.9805, longitude: 115.8185),
        description: "Ezone North cafe and dining area"
    )

    let categories = ["All Foods", "Available Now", "Beverages"]

    var body: some View {
        VStack(spacing: 0) {
            // title
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }

                    Text("Canteens Menu")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 15)

                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Ezone Cafe")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)

                        Spacer()

                        Text("Busy")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.pink)
                            .cornerRadius(12)
                    }

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
                    }

                    HStack(spacing: 20) {
                        HStack(spacing: 8) {
                            Image(systemName: "person.2")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)

                            Text("Est Waiting Time ~ 4mins")
                                .font(.system(size: 13))
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 6) {
                            Text("Available Spots")
                                .font(.system(size: 12))
                                .foregroundColor(.gray)

                            HStack(spacing: 4) {
                                Text("5")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)

                                Text("/50")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)

                            }

                            //progress bar
                            ProgressView(value: 5, total: 50)
                                .progressViewStyle(
                                    LinearProgressViewStyle(tint: .pink)
                                )
                                .frame(width: 80, height: 7)
                                .background(Color.gray.opacity(0.3))
                                .cornerRadius(2)
                        }
                    }

                    HStack(spacing: 8) {
                        Image(systemName: "location")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)

                        Text("222- Ezone North, Floor G")
                            .font(.system(size: 13))
                            .foregroundColor(.gray)

                        Spacer()
                    }
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            selectedCategory = category
                        }) {
                            Text(category)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(
                                    selectedCategory == category
                                        ? .white : .black
                                )
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .background(
                                    selectedCategory == category
                                        ? Color.black : Color.clear
                                )
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
            .padding(.bottom, 15)

            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 15)

                TextField("Search menu items...", text: $searchText)
                    .font(.system(size: 16))
                    .padding(.vertical, 12)

                Spacer()
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            //.padding(.top, 10)
            // Scrollable -start Menu Items
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 10),
                        GridItem(.flexible(), spacing: 10),
                    ], spacing: 15
                ) {
                    MenuItemCardEzone(
                        title: "Rice and Curry",
                        price: "$6.00",
                        isAvailable: true,
                        imageName: "rice_curry"
                    )

                    MenuItemCardEzone(
                        title: "Pan Cakes",
                        price: "$3.50",
                        isAvailable: true,
                        imageName: "pancakes"
                    )

                    MenuItemCardEzone(
                        title: "Nescafe",
                        price: "$2.00",
                        isAvailable: true,
                        imageName: "nescafe"
                    )

                    MenuItemCardEzone(
                        title: "Hot Chips",
                        price: "$3.00",
                        isAvailable: false,
                        imageName: "hot_chips"
                    )

                    MenuItemCardEzone(
                        title: "Iced Coffee",
                        price: "$4.50",
                        isAvailable: true,
                        imageName: "iced_coffee"
                    )

                    MenuItemCardEzone(
                        title: "Sandwiches",
                        price: "$5.00",
                        isAvailable: true,
                        imageName: "sandwiches"
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 120)
            }

            Spacer()

            VStack(spacing: 0) {

                NavigationLink(
                    destination: MapView(targetLocation: ezoneLocation)
                ) {
                    Text("Get Directions")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.black)
                        .cornerRadius(8)
                }
                .frame(maxWidth: 200)

                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 10)

//                BottomNavigationBar(selectedTab: selectedTab) { tab in
//                    selectedTab = tab
//
//                    switch tab {
//                    case "Home":
//
//                        break
//                    case "Map":
//
//                        break
//                    case "Library":
//
//                        break
//                    case "Cafe":
//
//                        break
//                    case "Halls":
//
//                        break
//                    case "Gym":
//
//                        break
//                    case "Parking":
//
//                        break
//                    default:
//                        break
//                    }
//                }
            }

            .background(Color.white)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }

    struct MenuItemCardEzone: View {
        let title: String
        let price: String
        let isAvailable: Bool
        let imageName: String

        var body: some View {
            VStack(spacing: 0) {

                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 100)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 12, topTrailingRadius: 12)
                    )
                    .overlay(
                        Group {
                            if imageName == "rice_curry" {
                                if let riceImage = UIImage(
                                    named: "RiceandCurry.jpg")
                                {
                                    Image(uiImage: riceImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                } else {
                                    Image(systemName: "bowl.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.gray)
                                }
                            } else if imageName == "pancakes" {
                                if let pancakeImage = UIImage(
                                    named: "Pancake.jpg")
                                {
                                    Image(uiImage: pancakeImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                } else {
                                    Image(systemName: "circle.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.gray)
                                }
                            } else if imageName == "nescafe" {
                                if let nescafeImage = UIImage(
                                    named: "Nescafe.jpg")
                                {
                                    Image(uiImage: nescafeImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                } else {
                                    Image(systemName: "cup.and.saucer.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.gray)
                                }
                            } else if imageName == "hot_chips" {
                                if let chipsImage = UIImage(
                                    named: "HotChips.jpg")
                                {
                                    Image(uiImage: chipsImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                } else {
                                    Image(systemName: "flame.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.gray)
                                }
                            } else if imageName == "iced_coffee" {
                                if let icedCoffeeImage = UIImage(
                                    named: "IcedCoffee.jpg")
                                {
                                    Image(uiImage: icedCoffeeImage)

                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 100)
                                        .frame(maxWidth: .infinity)
                                        .clipShape(
                                            UnevenRoundedRectangle(
                                                topLeadingRadius: 8,
                                                topTrailingRadius: 8))

                                    //.clipped()
                                } else {
                                    Image(systemName: "cup.and.saucer")
                                        .font(.system(size: 24))
                                        .foregroundColor(.gray)
                                }
                            } else if imageName == "sandwiches" {
                                if let sandwichImage = UIImage(
                                    named: "Sandwich.jpg")
                                {
                                    Image(uiImage: sandwichImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                } else {
                                    Image(systemName: "rectangle.stack.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(.gray)
                                }
                            } else {
                                Image(systemName: "fork.knife")
                                    .font(.system(size: 24))
                                    .foregroundColor(.gray)
                            }
                        }
                    )

                //contents
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)

                    HStack {
                        Text(price)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)

                        Text("-")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)

                        Text(isAvailable ? "Available" : "Unavailable")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(isAvailable ? .green : .red)

                        Spacer()
                    }
                }
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            .opacity(isAvailable ? 1.0 : 0.7)
        }

    }

    struct CanteenMenuEzoneCafeView_Previews: PreviewProvider {
        static var previews: some View {
            CanteenMenuEzoneCafeView()
        }
    }
}
