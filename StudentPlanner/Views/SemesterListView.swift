//
//  SemesterListView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct SemesterListView: View {
    @State var semesters: [Semester]
    @State var data = Semester.Data()
    @State private var count: Int = 2
    @State private var isCreating: Bool = false
    var body: some View {
        VStack {
            List {
                ForEach(semesters) { semester in
                    // TODO: Fill in the destination to each Cell
                    NavigationLink(destination: SemesterDetailsView(semester: semester)) {
                        SemesterCellView(semester: semester)
                    }
                    .padding(ViewDefaults.listCellPadding)
                }
                .onDelete(perform: delete)
                
                ForEach(semesters) { semester in
                    Section("\(semester.title)") {
                        ForEach(semester.courses, id: \.self) { course in
                            Text(course)
                        }
                        .padding(.horizontal, ViewDefaults.listCellPadding)
                    }
                }

            }
            addButton
        }
        .navigationTitle("Semesters")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                EditButton()
            }
        }
        .sheet(isPresented: $isCreating) {
            NavigationView {
                SemesterEditorView(data: $data)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                
                            }
                        }
                        
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isCreating = false
                            }
                        }
                    }
            }
        }
    }
    
    private var addButton: some View {
        Button {
            withAnimation {
                isCreating = true
            }
        } label: {
            Label("Create semester", systemImage: "plus.circle")
                .font(.title3)
        }
    }
    
    private func delete(at offset: IndexSet) {
        semesters.remove(atOffsets: offset)
    }
}

struct SemesterListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SemesterListView(semesters: Semester.sampleData)
        }
    }
}
