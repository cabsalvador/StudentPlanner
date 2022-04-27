//
//  TestDataService.swift
//  StudentPlanner
//
//  Created by Sal on 4/26/22.
//

import Foundation

class TestDataService: DataServiceProtocol {

    let testData: [Semester]
    
    init(data: [Semester]?) {
        self.testData = data ?? Semester.sampleData
    }
    
    func getSemestersArray() -> [Semester] {
        return Semester.sampleData

    }
}
