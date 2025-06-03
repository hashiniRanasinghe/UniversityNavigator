//
//  CrowdLevel.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-03.
//

import UIKit

// Models/CrowdLevel.swift
enum CrowdLevel: String, CaseIterable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    case busy = "Busy"
    
    var color: UIColor {
        switch self {
        case .low: return .crowdLow
        case .medium: return .crowdMedium
        case .high, .busy: return .crowdHigh
        }
    }
    
    var progress: Float {
        switch self {
        case .low: return 0.25
        case .medium: return 0.5
        case .high: return 0.75
        case .busy: return 1.0
        }
    }
}
