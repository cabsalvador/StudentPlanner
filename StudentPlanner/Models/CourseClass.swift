//
//  CourseClass.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import Foundation

struct CourseClass {
    var courseType: String
    var location: Location
    var instrutor: Instructor
    
    enum CourseType{
        case inPerson, online
    }
}
