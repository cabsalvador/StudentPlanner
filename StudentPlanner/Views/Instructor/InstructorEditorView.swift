//
//  InstructorEditorView.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import SwiftUI

struct InstructorEditorView: View {
    @Binding var data: Instructor.Data
    @State private var newEmail = ""
    @State private var newPhone = ""
    let isEditing: Bool
    var body: some View {
        VStack {
            List {
                
                Section("Info") {
                    TextField("First Name", text: $data.firstName)
                        .autocapitalization(.words)
                    TextField("Last Name", text: $data.lastName)
                        .autocapitalization(.words)
                    TextField("Title", text: $data.title)
                    TextField("Office Hours", text: $data.officeHours)
                    TextField("Webpage URL", text: $data.webpageURL)
                        .keyboardType(.webSearch)
                        .disableAutocorrection(false)
                        .autocapitalization(.none)
                }
                
                Section("Office") {
                    TextField("Building", text: $data.department)
                    TextField("Room", text: $data.officeRoom)
                }
                
                Section("Emails") {
                    if(!data.emails.isEmpty) {
                        ForEach(0..<data.emails.count, id: \.self) { index in
                            TextField("\(data.emails[index])", text: $data.emails[index])
                        }
                    }
                    
                    HStack(spacing: Defaults.buttonSpacing) {
                        Button(action: addNewEmail) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }

                        Text("Add Email")
                    }
                }
                
                Section("Phone Numbers") {
                    if(!data.phoneNumbers.isEmpty) {
                        ForEach(0..<data.phoneNumbers.count, id: \.self) { index in
                            
                            TextField("\(data.phoneNumbers[index])", text: $data.phoneNumbers[index])
                        }
                    }
                    
                    HStack(spacing: Defaults.buttonSpacing) {
                        Button(action: addNewPhone) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }

                        Text("Add Phone")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(isEditing ? "Edit Instructor" : "New Instructor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addNewEmail() {
        data.emails.append("")
        newEmail = ""
    }
    
    private func addNewPhone() {
        data.phoneNumbers.append("")
        newPhone = ""
    }
    
    private struct Defaults {
        static let buttonSpacing: CGFloat = 15
    }
}

struct InstructorEditorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                InstructorEditorView(data: .constant(SampleData.instructors[2].data), isEditing: true)
            }
            NavigationView {
                InstructorEditorView(data: .constant(Instructor(firstName: "", lastName: "", title: "", department: "", officeRoom: "", emails: [""], phoneNumbers: [""], officeHours: "", webpageURL: "").data), isEditing: false)
            }
        }
    }
}
