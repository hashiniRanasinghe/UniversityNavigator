//
//  ThemeManager.swift
//  UniversityNavigator
//
//  Created by Hashini Ranasinghe on 2025-06-03.
//

// Core/Theme/ThemeManager.swift
import UIKit

class ThemeManager {
    static let shared = ThemeManager()
    
    enum Theme {
        case light
        case dark
        case system
    }
    
    private var currentTheme: Theme = .system
    
    func setTheme(_ theme: Theme) {
        currentTheme = theme
        updateAppearance()
    }
    
    private func updateAppearance() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }
        
        switch currentTheme {
        case .light:
            window.overrideUserInterfaceStyle = .light
        case .dark:
            window.overrideUserInterfaceStyle = .dark
        case .system:
            window.overrideUserInterfaceStyle = .unspecified
        }
    }
}
