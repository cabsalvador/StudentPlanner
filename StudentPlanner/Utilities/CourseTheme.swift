//
//  CourseTheme.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct CourseTheme {
    static let symbols = [
        "desktopcomputer",
        "swift",
        "books.vertical.fill",
        "newspaper.fill",
        "graduationcap.fill",
        "music.quarternote.3",
        "heart.fill",
        "tshirt.fill",
        "brain.head.profile",
        "icloud.fill",
        "camera.fill",
        "video.fill",
        "cart.fill",
        "paintbrush.fill",
        "bandage.fill",
        "wrench.and.screwdriver.fill"
    ]
    
    static func randomSymbol() -> String {
        symbols.randomElement() ?? "desktopcomputer"
    }
    
    static let colors: [String] = [
        "red",
        "orange",
        "yellow",
        "green",
        "mint",
        "teal",
        "cyan",
        "blue",
        "indigo",
        "purple",
        "pink",
        "brown"
    ]
    
    static func randomColor() -> String {
        colors.randomElement() ?? "red"
    }
}
