//
//  DaysOfWeek.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import Foundation

enum DaysOfWeek:CaseIterable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var abbreviation: String {
        switch(self) {
        case .sunday: return "S"
        case .monday: return "M"
        case .tuesday: return "T"
        case .wednesday: return "W"
        case .thursday: return "R"
        case .friday: return "F"
        case .saturday: return "S"
        }
    }
}
