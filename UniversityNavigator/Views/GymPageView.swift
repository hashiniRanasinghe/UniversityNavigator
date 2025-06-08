//
//  GymPageView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-07.
//

import SwiftUI

struct GymPageView: View {
    @State private var selectedTab = "Home"
    @State private var emailText = ""
    @Environment(\.dismiss) private var dismiss

    let pastelGreen = Color(red: 0.6, green: 0.85, blue: 0.7)  // soft green
    let pastelRed = Color(red: 1.0, green: 0.7, blue: 0.7)  // soft red
    let pastelOrange = Color(red: 1.0, green: 0.8, blue: 0.6)  // soft orange

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

                Spacer()

                Text("Campus Gym")
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

                    // region card view
                    VStack(spacing: 0) {

                        ZStack {
                            AsyncImage(url: URL(string: "your_gym_image_url")) {
                                image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.orange.opacity(0.6),
                                                Color.red.opacity(0.4),
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                            }
                            .frame(height: 120)
                            .clipped()
                        }

                        VStack(alignment: .leading, spacing: 10) {

                            HStack {
                                Text("Fitness Centre")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)

                                Spacer()

                                Text("Available")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color.orange)
                                    .cornerRadius(12)
                            }

                            //hours
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

                                    Text("Current Capacity ~ 54%")
                                        .font(.system(size: 13))
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                VStack(alignment: .trailing, spacing: 6) {
                                    Text("Available Spots")
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)

                                    HStack(spacing: 4) {
                                        Text("27")
                                            .font(
                                                .system(size: 16, weight: .bold)
                                            )
                                            .foregroundColor(.black)

                                        Text("/50")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                    }

                                    //progress Bar
                                    ProgressView(value: 27, total: 50)
                                        .progressViewStyle(
                                            LinearProgressViewStyle(
                                                tint: .green)
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

                                Text("131 Building")
                                    .font(.system(size: 13))
                                    .foregroundColor(.gray)

                                Spacer()
                            }
                        }
                        .padding(16)
                        .background(Color.white)
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)

                    // end region card view
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Facilities")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)

                        //facilities
                        VStack(spacing: 15) {
                            HStack(spacing: 15) {
                                FacilityCard(
                                    icon: "drop", title: "Showers", color: .blue
                                )
                                FacilityCard(
                                    icon: "cabinet", title: "Lockers",
                                    color: .blue)
                            }

                            HStack(spacing: 15) {
                                FacilityCard(
                                    icon: "dumbbell", title: "Weights",
                                    color: .blue)
                                FacilityCard(
                                    icon: "figure.run", title: "Treadmills",
                                    color: .blue)
                            }
                        }
                        .padding(.horizontal, 20)
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text("Membership")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal, 20)

                        VStack(alignment: .leading, spacing: 12) {
                            Text("Join us — enter your email to get started.")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)

                            HStack {
                                TextField(
                                    "Type your email to get the application",
                                    text: $emailText
                                )
                                .font(.system(size: 14))
                                .padding(.horizontal, 15)
                                .padding(.vertical, 12)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)

                                Button(action: {

                                }) {
                                    Image(systemName: "checkmark")
                                        .font(
                                            .system(size: 16, weight: .medium)
                                        )
                                        .foregroundColor(.white)
                                        .frame(width: 40, height: 40)
                                        .background(Color.gray)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }

                    Button(action: {
                        // TODO: Navigate to directions
                    }) {
                        Text("Get Directions")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal, 100)
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                }
                .padding(.bottom, 100)
            }

            Spacer()

            BottomNavigationBar(selectedTab: selectedTab) { tab in
                selectedTab = tab
            }
        }
        .background(Color.white)
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct FacilityCard: View {
    let icon: String
    let title: String
    let color: Color

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.1))
                    .frame(width: 50, height: 50)

                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
            }

            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct GymPageView_Previews: PreviewProvider {
    static var previews: some View {
        GymPageView()
    }
}
