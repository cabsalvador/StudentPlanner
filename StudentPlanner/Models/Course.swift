//
//  Course.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import Foundation

struct Course: Identifiable, Hashable {
    let id: UUID
    var title: String
    var sfSymbol: String
    var color: String
    var assignments: [String]
    
    init(id: UUID = UUID(), title: String, sfSymbol: String, color: String, assignments:[String]) {
        self.id = id
        self.title = title
        self.sfSymbol = sfSymbol
        self.color = color
        self.assignments = assignments
    }
}

extension Course {
    
    var data: Data {
        Data(title: title, sfSymbol: sfSymbol, color: color, assignments: assignments)
    }
    
    init(using data: Data, id: UUID = UUID()) {
        self.id = id
        self.title = data.title
        self.sfSymbol = data.sfSymbol
        self.color = data.color
        self.assignments = data.assignments
    }
    
    struct Data {
        var title: String = ""
        var sfSymbol: String = ""
        var color: String = ""
        var assignments: [String] = []
    }
    
    mutating func update(from data: Data) {
        title = data.title
        sfSymbol = data.sfSymbol
        color = data.color
        assignments = data.assignments
    }
    
}

extension Course {
    static let sampleData = [
        Course(title: "Biology 1", sfSymbol: CourseTheme.symbols[1], color: CourseTheme.colors[1], assignments: ["Assignment 1", "Homework 1", "Quize 2"]),
        Course(title: "Intro to Algorithms", sfSymbol: CourseTheme.symbols[2], color: CourseTheme.colors[2], assignments: ["Project 1", "Quiz 3"]),
        Course(title: "English 101", sfSymbol: CourseTheme.symbols[3], color: CourseTheme.colors[3], assignments: ["Project 2", "Assignment 3", "PRoblem 3"])
        
    ]
}
