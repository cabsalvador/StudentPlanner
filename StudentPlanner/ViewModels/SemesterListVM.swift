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
    
    init() {
        self.semesters = SemesterListVM.createSemesters()
        self.data = Semester.Data()
        self.isEditorPresented = false
    }
    
    private static func createSemesters() -> [Semester] {
        let semesters = Semester.sampleData
        return semesters
    }
    
    func showSemesterEditor() {
        isEditorPresented = true
    }
    
    func dismiss() {
        isEditorPresented = false
    }
    
    func save() {
        withAnimation {
            isEditorPresented = false
            semesters.append(Semester(using: data))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                data = Semester.Data()
            }
        }
    }
    
    func delete(at offset: IndexSet) {
        semesters.remove(atOffsets: offset)
    }
}
