//
//  LocationModel.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-04.
//

import Foundation
import SwiftUI

// MARK: - Location Model
struct Location: Identifiable, Codable {
    let id = UUID()
    let name: String
    let category: LocationCategory
    let isOpen: Bool
    let capacity: Int
    let currentOccupancy: Int
    let coordinates: Coordinates
    let description: String
    let imageUrl: String?
    
    var availableSpots: Int {
        return capacity - currentOccupancy
    }
    
    var occupancyStatus: OccupancyStatus {
        let percentage = Double(currentOccupancy) / Double(capacity)
        
        switch percentage {
        case 0..<0.3:
            return .free
        case 0.3..<0.7:
            return .moderate
        default:
            return .busy
        }
    }
}

// MARK: - Supporting Models
struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

enum LocationCategory: String, CaseIterable, Codable {
    case library = "Library"
    case cafe = "Cafe"
    case gym = "Gym"
    case halls = "Halls"
    case office = "Office"
    case student = "Student Hub"
    
    var icon: String {
        switch self {
        case .library:
            return "book.fill"
        case .cafe:
            return "cup.and.saucer.fill"
        case .gym:
            return "dumbbell.fill"
        case .halls:
            return "building.2.fill"
        case .office:
            return "building.fill"
        case .student:
            return "person.2.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .library:
            return .blue
        case .cafe:
            return .red
        case .gym:
            return .purple
        case .halls:
            return .green
        case .office:
            return .orange
        case .student:
            return .cyan
        }
    }
}

enum OccupancyStatus: String, CaseIterable {
    case free = "Free"
    case moderate = "Moderate"
    case busy = "Busy"
    
    var color: Color {
        switch self {
        case .free:
            return .green
        case .moderate:
            return .orange
        case .busy:
            return .red
        }
    }
}

// MARK: - Sample Data
class LocationData: ObservableObject {
    @Published var locations: [Location] = [
        Location(
            name: "Reid Library",
            category: .library,
            isOpen: true,
            capacity: 100,
            currentOccupancy: 90,
            coordinates: Coordinates(latitude: -31.9774, longitude: 115.8178),
            description: "Main university library with study spaces and computer labs",
            imageUrl: nil
        ),
        Location(
            name: "Fitness Centre",
            category: .gym,
            isOpen: true,
            capacity: 50,
            currentOccupancy: 23,
            coordinates: Coordinates(latitude: -31.9780, longitude: 115.8190),
            description: "Fully equipped gym with modern equipment",
            imageUrl: nil
        ),
        Location(
            name: "Ezora Cafe",
            category: .cafe,
            isOpen: true,
            capacity: 30,
            currentOccupancy: 15,
            coordinates: Coordinates(latitude: -31.9770, longitude: 115.8185),
            description: "Campus cafe serving coffee and light meals",
            imageUrl: nil
        ),
        Location(
            name: "Program Office",
            category: .office,
            isOpen: true,
            capacity: 20,
            currentOccupancy: 5,
            coordinates: Coordinates(latitude: -31.9775, longitude: 115.8182),
            description: "Administrative office for academic programs",
            imageUrl: nil
        )
    ]
    
    var openLocations: [Location] {
        return locations.filter { $0.isOpen }
    }
    
    func locations(for category: LocationCategory) -> [Location] {
        return locations.filter { $0.category == category }
    }
}
