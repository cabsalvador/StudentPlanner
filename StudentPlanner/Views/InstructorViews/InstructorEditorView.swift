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
    @FocusState private var fieldInFocus: InstructorField?
    @FocusState private var nextEmail: Bool
    
    let isEditing: Bool
    var body: some View {
        VStack {
            List {
                
                Section("Info") {
                    TextField("First Name", text: $data.firstName)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .focused($fieldInFocus, equals: .firstname)
                    TextField("Last Name", text: $data.lastName)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                        .focused($fieldInFocus, equals: .lastname)
                    TextField("Title", text: $data.title)
                        .focused($fieldInFocus, equals: .title)
                    TextField("Office Hours", text: $data.officeHours)
                        .focused($fieldInFocus, equals: .officeHours)
                    TextField("Webpage URL", text: $data.webpageURL)
                        .focused($fieldInFocus, equals: .webpageURL)
                        .keyboardType(.webSearch)
                        .disableAutocorrection(false)
                        .autocapitalization(.none)
                }
                
                Section("Office") {
                    TextField("Department", text: $data.department)
                        .focused($fieldInFocus, equals: .officeBuilding)
                    TextField("Room", text: $data.officeRoom)
                        .focused($fieldInFocus, equals: .officeRoom)
                }
                
                Section("Emails") {
                    if(!data.emails.isEmpty) {
                        ForEach(0..<data.emails.count, id: \.self) { index in
                            TextField("\(data.emails[index])", text: $data.emails[index])
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            
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
                                .keyboardType(.namePhonePad)
                                
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
        nextEmail.toggle()
        print(data.emails.count)
        withAnimation {
            data.emails.append("")
            newEmail = ""
        }
    }
    
    private func addNewPhone() {
        withAnimation {
            data.phoneNumbers.append("")
            newPhone = ""
        }
    }
    
    private struct Defaults {
        static let buttonSpacing: CGFloat = 15
    }
    
    private enum InstructorField {
        case firstname
        case lastname
        case title
        case officeHours
        case webpageURL
        case officeBuilding
        case officeRoom
        case email
        case phone
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
