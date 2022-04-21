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
    @State private var data = Semester.Data()
    var body: some View {
        List {
            ForEach(semester.courses, id: \.self) { course in
                HStack {
                    Image(systemName: "facemask.fill")
                    Text(course)
                }
            }
            .padding(ViewDefaults.listCellPadding)
        }
        .navigationTitle(semester.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: { isEditing = true }) {
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
    }
}

struct SemesterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SemesterDetailsView(semester: Semester.sampleData[0])
        }
    }
}
