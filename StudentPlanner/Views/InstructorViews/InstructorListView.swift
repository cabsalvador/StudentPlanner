//
//  InstructorListView.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import SwiftUI

struct InstructorListView: View {
    @State var instuctors: [Instructor]
    @State var data = Instructor.Data()
    @State private var isPresentingEditor = false
    @State private var searchQuery = ""
    
    var body: some View {
        List {
            ForEach(instuctors.sorted { $0.lastName < $1.lastName }) { instructor in
                NavigationLink(destination: InstructorDetailView(instructor: instructor)) {
                    InstructorListCell(instructor: instructor)
                }
            }
        }
        .navigationBarTitle("Instructors")
        .searchable(text: $searchQuery)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: createNewInstructor) {
                    Label("New", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingEditor) {
            NavigationView {
                InstructorEditorView(data: $data, isEditing: false)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: dismiss) {
                                Text("Dismiss")
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: save) {
                                Text("Save")
                            }
                        }
                    }
                
            }
        }
    }
    
    
    private func createNewInstructor() {
        isPresentingEditor = true
    }
    
    private func dismiss() {
        isPresentingEditor = false
        data = Instructor.Data()
    }
    
    private func save() {
        withAnimation {
            isPresentingEditor = false
            instuctors.append(Instructor(using: data))
            data = Instructor.Data()
        }
    }
}

struct InstructorListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InstructorListView(instuctors: SampleData.instructors)
        }
    }
}
