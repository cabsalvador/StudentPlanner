//
//  Instructor.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import Foundation

struct Instructor: Identifiable {
    let id: UUID
    var firstName: String
    var lastName: String
    var title: String
    var department: String
    var officeRoom: String
    var emails: [String]
    var phoneNumbers: [String]
    var officeHours: String
    var webpageURL: String
    
    init(id: UUID = UUID(), firstName: String, lastName: String, title: String, department: String, officeRoom: String, emails: [String], phoneNumbers: [String], officeHours: String, webpageURL: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
        self.department = department
        self.officeRoom = officeRoom
        self.emails = emails
        self.phoneNumbers = phoneNumbers
        self.officeHours = officeHours
        self.webpageURL = webpageURL
    }
}

extension Instructor {
    var data: Data {
        Data(firstName: firstName, lastName: lastName, title: title, department: department, officeRoom: officeRoom, emails: emails, phoneNumbers: phoneNumbers, officeHours: officeHours, webpageURL: webpageURL)
    }
    
    init(using data: Data, id: UUID = UUID()) {
        self.id = id
        self.firstName = data.firstName
        self.lastName = data.lastName
        self.title = data.title
        self.department = data.department
        self.officeRoom = data.officeRoom
        self.emails = data.emails
        self.phoneNumbers = data.phoneNumbers
        self.officeHours = data.officeHours
        self.webpageURL = data.webpageURL
    }
    
    struct Data {
        var firstName = ""
        var lastName = ""
        var title = ""
        var department = ""
        var officeRoom = ""
        var emails: [String] = []
        var phoneNumbers: [String] = []
        var officeHours = ""
        var webpageURL = ""
    }
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    var namesAreEmpty: Bool {
        if(firstName.isEmpty && lastName.isEmpty) {
            return true
        }
        return false
    }
    
    mutating func update(from data: Data) {
        firstName = data.firstName
        lastName = data.lastName
        title = data.title
        department = data.department
        officeRoom = data.officeRoom
        emails = data.emails
        phoneNumbers = data.phoneNumbers
        officeHours = data.officeHours
        webpageURL = data.webpageURL
    }
}



