//
//  Colors.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-03.
//

// Core/Theme/Colors.swift
import UIKit

extension UIColor {
    static let primaryBackground = UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
            UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0) :
            UIColor.white
    }
    
    static let secondaryBackground = UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
            UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0) :
            UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
    }
    
    static let primaryText = UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
            UIColor.white : UIColor.black
    }
    
    static let secondaryText = UIColor { traitCollection in
        traitCollection.userInterfaceStyle == .dark ?
            UIColor.lightGray : UIColor.gray
    }
    
    static let accentColor = UIColor(red: 0.0, green: 0.48, blue: 1.0, alpha: 1.0)
    
    // Crowd level colors
    static let crowdLow = UIColor.systemGreen
    static let crowdMedium = UIColor.systemOrange
    static let crowdHigh = UIColor.systemRed
}
