//
//  MapView.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-08.
//

import CoreLocation
import MapKit
import SwiftUI

struct CampusLocation: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let category: LocationCategory
    let coordinate: CLLocationCoordinate2D
    let description: String


    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: CampusLocation, rhs: CampusLocation) -> Bool {
        lhs.id == rhs.id
    }
}

enum LocationCategory: String, CaseIterable {
    case library = "Library"
    case lectureHall = "Lecture Hall"
    case cafeteria = "Cafeteria"
    case gym = "Gym"
    case parking = "Parking"
    case admin = "Administration"

    var icon: String {
        switch self {
        case .library: return "book.fill"
        case .lectureHall: return "graduationcap.fill"
        case .cafeteria: return "fork.knife"
        case .gym: return "figure.walk"
        case .parking: return "car.fill"
        case .admin: return "building.2.fill"
        }
    }

    var color: Color {
        switch self {
        case .library: return .blue
        case .lectureHall: return .green
        case .cafeteria: return .orange
        case .gym: return .red
        case .parking: return .purple
        case .admin: return .gray
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        requestLocationPermission()
    }

    func requestLocationPermission() {
        manager.requestWhenInUseAuthorization()
    }

    func startLocationUpdates() {
        guard
            authorizationStatus == .authorizedWhenInUse
                || authorizationStatus == .authorizedAlways
        else {
            return
        }
        manager.startUpdatingLocation()
    }

    func stopLocationUpdates() {
        manager.stopUpdatingLocation()
    }

    func locationManager(
        _ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]
    ) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = location.coordinate
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        DispatchQueue.main.async {
            self.authorizationStatus = status
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self.startLocationUpdates()
            }
        }
    }
}

struct MapView: View {
    let targetLocation: CampusLocation?

    init(targetLocation: CampusLocation? = nil) {
        self.targetLocation = targetLocation
    }
    @StateObject private var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -31.9805, longitude: 115.8170),  //coordinates og the uwa university
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var selectedLocation: CampusLocation?
    @State private var showingDirections = false
    @State private var route: MKRoute?
    @State private var showingLocationList = false
    @State private var selectedCategory: LocationCategory?
    @State private var searchText = ""
    @State private var selectedTab = "Map"
    @Environment(\.dismiss) private var dismiss

    //uwa locations
    let campusLocations: [CampusLocation] = [

        CampusLocation(
            name: "Reid Library", category: .library,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9790, longitude: 115.8175),
            description: "Main university library"),
        CampusLocation(
            name: "Barry J Marshall Library", category: .library,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9805, longitude: 115.8190),
            description: "Medical and health sciences library"),
        CampusLocation(
            name: "Beasley Law Library", category: .library,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9780, longitude: 115.8160),
            description: "Specialized law library"),

        CampusLocation(
            name: "Anatomy Lecture Room 181", category: .lectureHall,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9795, longitude: 115.8170),
            description: "Historic main lecture hall"),
        CampusLocation(
            name: "Law Lecture Room 2", category: .lectureHall,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9810, longitude: 115.8180),
            description: "Physics department lecture facilities"),
        CampusLocation(
            name: "Engineering Lecture Theatre", category: .lectureHall,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9800, longitude: 115.8185),
            description: "Engineering faculty lecture halls"),
        CampusLocation(
            name: "Business School Lecture Theatre", category: .lectureHall,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9785, longitude: 115.8165),
            description: "Business school lecture facilities"),

        CampusLocation(
            name: "Hackett Cafe", category: .cafeteria,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9795, longitude: 115.8180),
            description: "Main campus cafe and dining area"),
        CampusLocation(
            name: "Business Café", category: .cafeteria,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9790, longitude: 115.8165),
            description: "Fine dining and events venue"),

        CampusLocation(
            name: "Sports Centre", category: .gym,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9820, longitude: 115.8190),
            description: "Main sports and fitness facilities"),

        CampusLocation(
            name: "Staff Parking", category: .parking,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9800, longitude: 115.8150),
            description: "Primary campus parking area"),
        CampusLocation(
            name: "Student & Visitor Parking", category: .parking,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9825, longitude: 115.8195),
            description: "Parking near sports facilities"),

        CampusLocation(
            name: "Administration Building", category: .admin,
            coordinate: CLLocationCoordinate2D(
                latitude: -31.9785, longitude: 115.8175),
            description: "Main administration and student services"),
    ]

    var filteredLocations: [CampusLocation] {
        var locations = campusLocations

        if let category = selectedCategory {
            locations = locations.filter { $0.category == category }
        }

        if !searchText.isEmpty {
            locations = locations.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
                    || $0.description.localizedCaseInsensitiveContains(
                        searchText)
            }
        }

        return locations
    }
    @Environment(\.presentationMode) var presentationMode
    @State private var navigateToHome = false

    
    private func handleBackButton() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .light)
        impactFeedback.impactOccurred()
        if presentationMode.wrappedValue.isPresented {
            presentationMode.wrappedValue.dismiss()
        } else {
            navigateToHome = true
        }
    }
    
    var body: some View {

        VStack(spacing: 0) {
            
            VStack(spacing: 0) {
                HStack {      Button(action: {
                    handleBackButton()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                }
                    .buttonStyle(PlainButtonStyle())
                    
                    Text("Campus Map")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)

                    Spacer()

                    Button(action: { showingLocationList.toggle() }) {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }

            //filters
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    Button("All") {
                        selectedCategory = nil
                    }
                    .buttonStyle(
                        FilterButtonStyle(isSelected: selectedCategory == nil))

                    ForEach(LocationCategory.allCases, id: \.self) { category in
                        Button(category.rawValue) {
                            selectedCategory =
                                selectedCategory == category ? nil : category
                        }
                        .buttonStyle(
                            FilterButtonStyle(
                                isSelected: selectedCategory == category))
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 15)

            //map
            ZStack {
                Map(
                    coordinateRegion: $region,
                    showsUserLocation: true,
                    userTrackingMode: .constant(.none),
                    annotationItems: filteredLocations
                ) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: location.category.icon)
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .bold))
                                .frame(width: 30, height: 30)
                                .background(location.category.color)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .shadow(radius: 3)

                            Text(location.name)
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(8)
                                .shadow(radius: 2)
                        }
                        .onTapGesture {
                            selectedLocation = location
                            withAnimation {
                                region.center = location.coordinate
                            }
                        }
                    }
                }

                VStack {
                    Spacer()

                    HStack {
                        //my location btn

                        Button(action: centerOnUserLocation) {
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                                .frame(width: 44, height: 44)
                                .background(Color.black)
                                .cornerRadius(22)
                                .shadow(radius: 2)
                        }

                        Spacer()

                        if route != nil {
                            Button(action: clearRoute) {
                                Text("Clear Route")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color.red)
                                    .cornerRadius(20)
                                    .shadow(radius: 2)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
                }
            }

            Spacer()

        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea(.all, edges: .bottom)
        .sheet(item: $selectedLocation) { location in
            LocationDetailView(
                location: location,
                userLocation: locationManager.userLocation,
                onGetDirections: { getDirections(to: location) }
            )
        }
        .sheet(isPresented: $showingLocationList) {
            LocationListView(
                locations: filteredLocations,
                searchText: $searchText,
                onLocationSelected: { location in
                    selectedLocation = location
                    showingLocationList = false
                    withAnimation {
                        region.center = location.coordinate
                    }
                }
            )
        }
        .onAppear {
            locationManager.startLocationUpdates()

            if let target = targetLocation {
                withAnimation {
                    region.center = target.coordinate
                }
                selectedLocation = target
            }
        }
    }

    private func centerOnUserLocation() {
        guard let userLocation = locationManager.userLocation else { return }
        withAnimation {
            region.center = userLocation
        }
    }

    private func getDirections(to location: CampusLocation) {
        guard let userLocation = locationManager.userLocation else {
            print("User location not available")
            return
        }

        let request = MKDirections.Request()
        request.source = MKMapItem(
            placemark: MKPlacemark(coordinate: userLocation))
        request.destination = MKMapItem(
            placemark: MKPlacemark(coordinate: location.coordinate))
        request.transportType = .walking

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let error = error {
                print(
                    "Error calculating directions: \(error.localizedDescription)"
                )
                return
            }

            guard let route = response?.routes.first else {
                print("No routes found")
                return
            }

            DispatchQueue.main.async {
                self.route = route
                let rect = route.polyline.boundingMapRect
                let region = MKCoordinateRegion(rect)
                withAnimation {
                    self.region = region
                }
            }
        }
    }

    private func clearRoute() {
        route = nil
    }
}

struct FilterButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(isSelected ? .white : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isSelected ? Color.black : Color.clear)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct LocationDetailView: View {
    let location: CampusLocation
    let userLocation: CLLocationCoordinate2D?
    let onGetDirections: () -> Void
    @Environment(\.dismiss) private var dismiss

    private var distance: String {
        guard let userLocation = userLocation else { return "Unknown" }
        let userCLLocation = CLLocation(
            latitude: userLocation.latitude, longitude: userLocation.longitude)
        let locationCLLocation = CLLocation(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude)
        let distanceInMeters = userCLLocation.distance(from: locationCLLocation)
        return String(format: "%.0fm away", distanceInMeters)
    }

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

                    Text("Location Details")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    //location info card

                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: location.category.icon)
                                .foregroundColor(.white)
                                .font(.title2)
                                .frame(width: 50, height: 50)
                                .background(location.category.color)
                                .cornerRadius(25)

                            VStack(alignment: .leading, spacing: 4) {
                                Text(location.name)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.black)
                                Text(location.category.rawValue)
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                if userLocation != nil {
                                    Text(distance)
                                        .font(.system(size: 12))
                                        .foregroundColor(.blue)
                                }
                            }

                            Spacer()
                        }

                        Text(location.description)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .lineLimit(nil)
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)

                    //action btns
                    VStack(spacing: 12) {

                        Button(action: openInMaps) {
                            HStack {
                                Image(systemName: "map.fill")
                                    .font(.system(size: 16))
                                Text("Open in Maps")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.green)
                            .cornerRadius(25)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .background(Color.white)
        .navigationBarHidden(true)
    }

    private func openInMaps() {
        let placemark = MKPlacemark(coordinate: location.coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = location.name

        let launchOptions = [
            MKLaunchOptionsDirectionsModeKey:
                MKLaunchOptionsDirectionsModeWalking
        ]

        mapItem.openInMaps(launchOptions: launchOptions)
    }
}

struct LocationListView: View {
    let locations: [CampusLocation]
    @Binding var searchText: String
    let onLocationSelected: (CampusLocation) -> Void
    @Environment(\.dismiss) private var dismiss

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

                    Text("Campus Locations")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }

            SearchBar(text: $searchText)
                .padding(.bottom, 15)

            List(locations) { location in
                LocationRow(location: location) {
                    onLocationSelected(location)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(
                    EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.white)
        .navigationBarHidden(true)
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {

        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 15)

            TextField("Search locations...", text: $text)
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
        .padding(.horizontal, 20)

        //        HStack {
        //            Image(systemName: "magnifyingglass")
        //                .foregroundColor(.gray)
        //
        //            TextField("Search locations...", text: $text)
        //                .font(.system(size: 14))
        //        }
        //        .padding(.horizontal, 16)
        //        .padding(.vertical, 10)
        //        .background(Color.gray.opacity(0.1))
        //        .cornerRadius(20)
        //        .overlay(
        //            RoundedRectangle(cornerRadius: 20)
        //                .stroke(Color.black, lineWidth: 1)
        //        )
        .padding(.horizontal, 20)
    }
}

struct LocationRow: View {
    let location: CampusLocation
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                Image(systemName: location.category.icon)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(location.category.color)
                    .clipShape(Circle())

                VStack(alignment: .leading, spacing: 4) {
                    Text(location.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .truncationMode(.tail)

                    Text(location.category.rawValue)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(1)

                    Text(location.description)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding(12)
            .contentShape(Rectangle())  //makes entire hstack tappable
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 10)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
