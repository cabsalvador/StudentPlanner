//
//  SampleData.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import Foundation

struct SampleData {
    static let departments = [
        "Art",
        "Design",
        "History",
        "Music",
        "Theatre & Dance",
        "Communications Studies",
        "English",
        "Humanites & Religious Studies",
        "Philosophy",
        "World Languages & Literatures",
        
        "Business",
        
        "Education",
        
        "Civil Engineering",
        "Computer Engineering",
        "Computer Science",
        "Construction Management",
        "Electrical Engineering",
        "Mechanical Engineering",
        
        "Criminal Justice",
        "Kinesiology",
        "Nursing",
        "Physical Therapy",
        "Public Health",
        "Recreation, Park, & Tourism",
        "Social Work",
        
        "Biological Sciences",
        "Chemistry",
        "Geography",
        "Geology",
        "Math & Statistics",
        "Physics",
        "Astronomy",
        
        "Anthropology",
        "Economics",
        "Ethnic Studies",
        "Political Studies",
        "Sociology",
        "Environmental Studies",
        "Liberal Studies",
        "Social Science",
        "Women's & Gender Studies"
    ]
    
    static let instructors: [Instructor] = [
        Instructor(firstName: "Yuan", lastName: "Chen", title: "Assistant Professor", department: SampleData.departments[14], officeRoom: "RVR 5042", emails: ["chengy@ecs.csus.edu"], phoneNumbers: ["909-827-0675"], officeHours: "", webpageURL: "http://www.ycheng.org"),
        Instructor(firstName: "Jun", lastName: "Dai", title: "Assistant Professor", department: SampleData.departments[13], officeRoom: "RVR 5060", emails: ["daij@ecs.csus.edu"], phoneNumbers: ["909-827-0675"], officeHours: "", webpageURL: ""),
        Instructor(firstName: "V. Scott", lastName: "Gordan", title: "Professor", department: SampleData.departments[12], officeRoom: "", emails: ["gordonvs@ecs.csus.edu", "demo@csus.edu"], phoneNumbers: ["909-827-0675"], officeHours: "", webpageURL: "https://athena.ecs.csus.edu/~gordonvs/"),
        Instructor(firstName: "Meiliu", lastName: "Lu", title: "Professor", department: SampleData.departments[11], officeRoom: "RVR 5016", emails: ["mei@ecs.csus.edu"], phoneNumbers: ["909-827-0675"], officeHours: "", webpageURL: "https://www.ecs.csus.edu/wcm/csc/people/lu/"),
        Instructor(firstName: "Ruthann ", lastName: "Biel", title: "Professor", department: "Computer Science", officeRoom: "RVR 5015", emails: ["bielr@ecs.csus.edu"], phoneNumbers: ["909-827-0675"], officeHours: "", webpageURL: "")
    ]
}
