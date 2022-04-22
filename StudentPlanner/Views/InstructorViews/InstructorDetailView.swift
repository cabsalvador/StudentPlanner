//
//  InstructorDetailView.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import SwiftUI

struct InstructorDetailView: View {
    @State var instructor: Instructor
    @State private var data = Instructor.Data()
    @State private var isEditing = false
    var body: some View {
        VStack(alignment: .center) {
            header
            
            List {
                Section("Office") {
                    Text(instructor.officeRoom)
                    if (!instructor.officeHours.isEmpty) {
                        Text(instructor.officeHours)
                    }
                }
                
                Section("Emails") {
                    ForEach(instructor.emails, id: \.self) { email in
                        Button(action: {}) {
                            Text(email)
                        }
                    }
                }
                
                Section("Phone Numbers") {
                    ForEach(0..<instructor.phoneNumbers.count, id: \.self) { index in
                        Button(action: { performCall(index) }) {
                            Text(instructor.phoneNumbers[index])
                        }
                    }
                }
                
                if(instructor.webpageURL.isEmpty) {
                    Section("Webpage") {
                        Link("est",destination: URL(string: "http://www.ycheng.org")!)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: presentEdit) {
                    Text("Edit")
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            NavigationView {
                InstructorEditorView(data: $data, isEditing: true)
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
    
    var header: some View {
        VStack(alignment: .center) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 72))
                .foregroundColor(.secondary)
            
            Text(instructor.fullName)
                .font(.title)
            Text(instructor.title)
                .font(.caption)
                .foregroundColor(.gray)
            
        }
    }
    
    private func performCall(_ index: Int) {
        // Append 'tel:/' to phone string to perform call
        let phone = "tel://"
        let phoneNumberFormatted = phone + instructor.phoneNumbers[index]
        guard let url = URL(string: phoneNumberFormatted) else { return }
        
        UIApplication.shared.open(url)
    }
    
    private func presentEdit() {
        data = instructor.data
        isEditing = true
    }
    
    private func dismiss() {
        isEditing = false
    }
    
    private func save() {
        instructor.update(from: data)
        isEditing = false
    }
    
}

struct InstructorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                InstructorDetailView(instructor: SampleData.instructors[0])
            }
            
            NavigationView {
                InstructorDetailView(instructor: SampleData.instructors[1])
            }
        }
    }
}
