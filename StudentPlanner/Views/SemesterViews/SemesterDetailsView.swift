//
//  SemesterDetailsView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct SemesterDetailsView: View {
    @State var semester: Semester
    @State private var isEditing = false
    @State private var isPresentingCourseEditor = false
    @State private var data = Semester.Data()
    @State private var courseData = Course.Data()
    var body: some View {
        List {
            ForEach($semester.courses, id: \.self) { $course in
                NavigationLink(destination: CourseDetailView(course: $course)) {
                    CourseCellView(course: course)
                }
            }
            .padding(ViewDefaults.listCellPadding)
        }
        .navigationTitle(semester.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {}) {
                        Label("New course", systemImage: "doc")
                    }
                    
                    Button {
                        data = semester.data
                        isEditing = true
                    } label: {
                        Label("Edit semester", systemImage: "ellipsis")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
                
            }
        }
        .sheet(isPresented: $isEditing) {
            NavigationView {
                SemesterEditorView(data: $data)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                
                            }
                        }
                        
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isEditing = false
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresentingCourseEditor) {
            NavigationView {
                CourseEditorView(data: $courseData)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: saveCourse) {
                                Text("Save")
                            }
                        }
                        
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: dismissCourseEditor) {
                                Text("Dismiss")
                            }
                        }
                    }
            }
        }
    }
    
    private func createCourse() {
        isPresentingCourseEditor = true
//        semester.courses.append(<#T##newElement: String##String#>)
    }
    
    private func dismissCourseEditor() {
        isPresentingCourseEditor = false
    }
    
    private func saveCourse() {
        isPresentingCourseEditor = false
    }
}

struct SemesterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SemesterDetailsView(semester: Semester.sampleData[0])
        }
    }
}

struct CourseCellView: View {
    let course: Course
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: course.sfSymbol)
                .foregroundColor(Color(course.color))
            Text(course.title)
        }
        .font(.title3)
        .badge(course.assignments.count)
    }
}
