//
//  SemestersVM.swift
//  StudentPlanner
//
//  Created by Sal on 4/26/22.
//

import SwiftUI

class SemesterListVM: ObservableObject {
    @Published var semesters: [Semester]
    @Published var data: Semester.Data
    @Published var isEditorPresented: Bool
    @Published var selectedSemester: Semester?
    let dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        self.data = Semester.Data()
        self.isEditorPresented = false
        semesters = []
        loadSemesters()
    }
    
    init(semesters:[Semester] = [], isEditorPresented: Bool = true) {
        self.data = Semester.Data()
        self.semesters = []
        self.isEditorPresented = isEditorPresented
        self.dataService = TestDataService(data: Semester.sampleData)
    }
    
    private func loadSemesters() {
        semesters = dataService.getSemestersArray()
    }
    
    func showSemesterEditor() {
        isEditorPresented = true
    }
    
    func dismiss() {
        isEditorPresented = false
    }
    
    func save() {
        withAnimation {
            dismiss()
            semesters.append(Semester(using: data))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                data = Semester.Data()
            }
        }
    }
    
    func delete(at offset: IndexSet) {
        semesters.remove(atOffsets: offset)
    }
    
    func select(semester: Semester) {
        if let x = semesters.first(where: { $0.id == semester.id }) {
            selectedSemester = x
        } else {
            selectedSemester = nil
        }
    }
}
