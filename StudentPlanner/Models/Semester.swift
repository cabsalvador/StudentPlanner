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
    var courses: [String]
    
    init(id: UUID = UUID(), title: String, start: Date, end: Date, courses: [String]) {
        self.id = id
        self.title = title
        self.start = start
        self.end = end
        self.courses = courses
    }
}

extension Semester {
    var data: Data {
        Data(title: title, start: start, end: end, courses: courses)
    }
    
    struct Data {
        var title: String = ""
        var start: Date = Date()
        var end: Date = Calendar.current.date(byAdding: .month, value: 4, to: Date.now) ?? Date.now
        var courses: [String] = []
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
        Semester(title: "Fall 2020", start: Date.now, end: Date(), courses: ["Biology 1", "Anthropolgy 121", "Math 29"]),
        Semester(title: "Spring 2021", start: Date(), end: Date.distantFuture, courses: ["English 101", "Art 102", "Communications 131", "Physics 5B"]),
        Semester(title: "Fall 2021", start: Date.distantFuture, end: Date.distantFuture, courses: ["Math 30", "Music 101"])
    ]
}
