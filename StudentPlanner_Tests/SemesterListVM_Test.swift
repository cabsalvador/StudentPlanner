//
//  SemesterListVM_Test.swift
//  StudentPlanner_Tests
//
//  Created by Sal on 4/26/22.
//

import XCTest
@testable import StudentPlanner

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior

// Testing Structure: Given, When, Then

class SemesterListVM_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_SemesterListVM_isEditorPresented_Injected_stress() {
        for _ in 0..<5 {
            // Given
            let isPresented: Bool = true
            
            // When
            let vm = SemesterListVM(isEditorPresented: isPresented)
            
            // Then
            XCTAssertEqual(vm.isEditorPresented, isPresented)
        }
    }
    
    func test_SemesterListVM_semesters_shouldBeEmpty() {
        // Given
        
        // When
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
        
        // Then
        XCTAssertTrue(vm.semesters.isEmpty)
        XCTAssertEqual(vm.semesters.count, 0)
    }
    
    func test_SemesterListVM_semesters_dismiss() {
        // Given
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
        
        // When
        vm.dismiss()
        
        // Then
        XCTAssertTrue(!vm.isEditorPresented)
    }
    
    func test_SemesterListVM_semesters_save() {
        // Given
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
        let loopCount: Int = Int.random(in: 1...10)
        
        // When
        for _ in 0..<loopCount {
            vm.save()
        }
        
        
        // Then
        XCTAssertTrue(!vm.semesters.isEmpty)
        XCTAssertTrue(!vm.isEditorPresented)
        XCTAssertEqual(vm.semesters.count, loopCount)
    }
    
    func test_SemesterListVM_selectedSemester_shouldStartAsNil() {
        // Given
        
        // When
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
        
        // Then
        XCTAssertTrue(vm.selectedSemester == nil)
        XCTAssertNil(vm.selectedSemester)
    }
    
    func test_SemesterListVM_selectedSemester_shouldBeNilWhenSelectingInvalidSemester() {
        // Given
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
        
        // When
        // Select valid semester
        let semester = Semester(using: Semester.Data())
        vm.semesters.append(semester)
        vm.select(semester: semester)
        
        // Select invalid semester
        vm.select(semester: Semester(title: "", start: Date.now, end: Date.now, courses: []))
        
        // Then
        XCTAssertNil(vm.selectedSemester)
    }
    
    func test_SemesterListVM_selectedSemester_shouldBeSelected() {
        // Given
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
 
        // When
        let semester = Semester(using: Semester.Data())
        vm.semesters.append(semester)
        vm.select(semester: semester)
        
        // Then
        XCTAssertNotNil(vm.selectedSemester)
        XCTAssertEqual(vm.selectedSemester?.id, semester.id)
    }
    
    func test_SemesterListVM_selectedSemester_shouldBeSelected_stress() {
        // Given
        let vm = SemesterListVM(semesters: [], isEditorPresented: Bool.random())
 
        // When
        let loopCount: Int = Int.random(in: 1..<20)
        var semesterArrays: [Semester] = []
        for _ in 0..<loopCount {
            let semester = Semester(using: Semester.Data())
            vm.semesters.append(semester)
            semesterArrays.append(semester)
        }
        let randSemester = semesterArrays.randomElement() ?? Semester(using: Semester.Data())
        vm.select(semester: randSemester)
        // Then
        XCTAssertNotNil(vm.selectedSemester)
        XCTAssertEqual(vm.selectedSemester?.id, randSemester.id)
    }
}
