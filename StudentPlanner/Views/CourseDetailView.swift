//
//  CourseDetailView.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import SwiftUI

struct CourseDetailView: View {
    @State private var data = Course.Data()
    @State private var isPresentingEditView = false
    @Binding var course: Course
    
    var body: some View {
        VStack {
            title
            .font(.largeTitle)
            .foregroundColor(Color(course.color))
            
            VStack {
                Text("\(course.assignments.count) ")
                    .font(.title)
                Text("Current".uppercased())
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            
            assigmentList
                .listStyle(.grouped)

        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {}) {
                        Label("New Assignment", systemImage: "doc.badge.plus")
                    }
                    Button(action: presentEditView) {
                        Label("Edit", systemImage: "lineweight")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                CourseEditorView(data: $data)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: dismissEditView, label: { Text("Dismiss") })
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: updateCourse, label: { Text("Save") })
                        }
                    }
            }
        }
    }
    
    private var title: some View {
        HStack(spacing: 10) {
            Image(systemName: course.sfSymbol)
            Text(course.title)
        }
    }
    
    private var assigmentList: some View {
        List {
            Section("Assignments"){
                ForEach(course.assignments, id: \.self) { `assignment` in
                    Text(`assignment`)
                        .padding(.vertical, 5)
                }
            }
            
        }
    }
    
    private func presentEditView() {
        data = course.data
        isPresentingEditView = true
    }
    private func dismissEditView() {
        isPresentingEditView = false
    }
    
    private func updateCourse() {
        isPresentingEditView = false
        course.update(from: data)
    }
    

}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                CourseDetailView(course: .constant(Course.sampleData[0]))
            }
            NavigationView {
                CourseDetailView(course: .constant(Course.sampleData[0]))
                    .preferredColorScheme(.dark)
            }
        }
    }
}
