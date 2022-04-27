//
//  CourseEditorView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

// TODO: Complete CourseEditorView
struct CourseEditorView: View {
    @Binding var data: Course.Data
    @State private var assignmentTitle = ""
    @State private var isEditingSymbol = false
    
    @State private var tempSymbol: String = ""
    @State private var tempColor: String = ""
    var body: some View {
        Form {
            Section("Details") {
                HStack(spacing: 15) {
                    Button {
                        tempSymbol = data.sfSymbol
                        tempColor = data.color
                        isEditingSymbol = true
                    } label: {
                        Image(systemName: data.sfSymbol)
                            .foregroundColor(Color(data.color))
                    }
                    TextField("Title", text: $data.title)
                }
                
            }
            
            Section("Meeting Times") {
            }
            
            Section("Assignments") {
                ForEach(data.assignments, id: \.self) { `assignment` in
                    Text(`assignment`)
                }
                
                HStack(spacing: 15) {
                    Button(action: createNewAssignment) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                    Text("New Assignment")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isEditingSymbol) {
            NavigationView {
                CourseThemeView(selectedSymbol: $data.sfSymbol, selectedColor: $data.color)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                
                            }
                        }
                    }
            }
        }
    }
    
    private func createNewAssignment() {
        let newAssignment = assignmentTitle
        data.assignments.append(newAssignment)
        assignmentTitle = ""
    }
}

struct CourseEditorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseEditorView(data: .constant(Course.sampleData[1].data))
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: {}, label: { Text("Dismiss") })
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: {}, label: { Text("Save") })
                    }
                }
        }
    }
}
