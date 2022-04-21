//
//  SemesterEditorView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct SemesterEditorView: View {
    @Binding var data: Semester.Data
    @State private var newCourseTitle = ""
    let isEditing = false
    
    var body: some View {
        Form {
            Section("Details") {
                TextField("Title", text: $data.title)
                DatePicker("Start", selection: $data.start, displayedComponents: [.date])
                DatePicker("End", selection: $data.end, in: data.start..., displayedComponents: [.date])
            }
            
            Section("Courses") {
                ForEach(data.courses, id: \.self) { course in
                    Text(course)
                }
                HStack {
                    TextField("New Course", text: $newCourseTitle)
                    Button(action: createNewCourse) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newCourseTitle.isEmpty)
                }
            }
        }
        .navigationBarTitle(isEditing ? "Edit" : "Semester")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func createNewCourse() {
        withAnimation {
            data.courses.append(newCourseTitle)
        }
        newCourseTitle = ""
    }
}

struct SemesterEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SemesterEditorView(data: .constant(Semester.sampleData[0].data))
        }
        
    }
}
