//
//  StudentPlannerApp.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

@main
struct StudentPlannerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                InstructorEditorView(data: .constant(Instructor(firstName: "", lastName: "", title: "", department: "", officeRoom: "", emails: [], phoneNumbers: [], officeHours: "", webpageURL: "").data), isEditing: false)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {}
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {}
                        }
                    }
            }
        }
    }
}
