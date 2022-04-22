//
//  Semester.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import Foundation

struct Semester: Identifiable {
    let id: UUID
    var title: String
    var start: Date
    var end: Date
    var courses: [Course]
    
    init(id: UUID = UUID(), title: String, start: Date, end: Date, courses: [Course]) {
        self.id = id
        self.title = title
        self.start = start
        self.end = end
        self.courses = courses
    }
}

extension Semester {
    
    init(using data: Data, id: UUID = UUID()) {
        self.id = id
        self.title = data.title
        self.start = data.start
        self.end = data.end
        self.courses = data.courses
    }
    
    
    var data: Data {
        Data(title: title, start: start, end: end, courses: courses)
    }
    
    struct Data {
        var title: String = ""
        var start: Date = Date()
        var end: Date = Calendar.current.date(byAdding: .month, value: 4, to: Date.now) ?? Date.now
        var courses: [Course] = []
    }
    
    mutating func update(from data: Data) {
        title = data.title
        start = data.start
        end = data.end
        courses = data.courses
    }
}

extension Semester {
    static let sampleData = [
        Semester(title: "Fall 2020", start: Date.now, end: Date(), courses: Course.sampleData),
        Semester(title: "Spring 2021", start: Date(), end: Date.distantFuture, courses: Course.sampleData),
        Semester(title: "Fall 2021", start: Date.distantFuture, end: Date.distantFuture, courses: Course.sampleData)
    ]
}
