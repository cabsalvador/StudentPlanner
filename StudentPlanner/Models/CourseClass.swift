//
//  CourseClass.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import Foundation

struct CourseClass: Identifiable {
    let id: UUID
    var learningStyle: LearningStyle
    var location: Location
    var instrutor: Instructor
    
    enum LearningStyle {
        case inPerson, online
    }
    
    enum ClassType: String {
        case `class`
        case lab
        case lecture
        case seminar
        case studyGroup = "Study Group"
    }
}
