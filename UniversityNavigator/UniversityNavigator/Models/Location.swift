//
//  Location.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-03.
//

// Models/Location.swift
import Foundation

struct Location {
    let id: String
    let name: String
    let building: String
    let floor: String?
    let crowdLevel: CrowdLevel
    let isOpen: Bool
    let openingHours: String?
    let facilities: [String]
}

