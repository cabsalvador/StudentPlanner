//
//  SemesterEditorView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct SemesterEditorView: View {
    @Binding var data: Semester.Data
    @State private var newCourseData = Course.Data()
    @FocusState private var focusedCourse: Bool
    let isEditing = false
    
    var body: some View {
        Form {
            Section("Details") {
                TextField("Title", text: $data.title)
                DatePicker("Start", selection: $data.start, displayedComponents: [.date])
                DatePicker("End", selection: $data.end, in: data.start..., displayedComponents: [.date])
            }
            
            Section("Courses") {
                ForEach(0..<data.courses.count, id: \.self) { index in
                    HStack {
                        if index == data.courses.count-1 {
                            TextField("\(data.courses[index].title)", text: $data.courses[index].title)
                                .focused($focusedCourse)
                        } else {
                            TextField("\(data.courses[index].title)", text: $data.courses[index].title)
                        }
                    }
                }
                
                HStack(spacing: 15) {
                    Button(action: createNewCourse) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                    HStack {
                        Text("New Course")
                    }
                }
            }
        }
        .navigationBarTitle(isEditing ? "Edit" : "Semester")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func createNewCourse() {
        withAnimation {
            data.courses.append(Course(using: newCourseData))
            newCourseData = Course.Data()
        }
    }
}

struct SemesterEditView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                SemesterEditorView(data: .constant(Semester.sampleData[0].data))
            }
            NavigationView {
                SemesterEditorView(data: .constant(Semester(title: "", start: Date(), end: Date(), courses: []).data))
            }
        }
        
    }
}
