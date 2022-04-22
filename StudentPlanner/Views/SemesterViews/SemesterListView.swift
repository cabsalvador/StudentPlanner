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
    @State private var isEditorPresented: Bool = false
    var body: some View {
        VStack {
            List {
                ForEach(semesters) { semester in
                    NavigationLink(destination: SemesterDetailsView(semester: semester)) {
                        SemesterCellView(semester: semester)
                    }
                }
                .onDelete(perform: delete)
                
                ForEach(semesters) { semester in
                    Section("\(semester.title)") {
                        ForEach(semester.courses, id: \.self) { course in
                            HStack {
                                Image(systemName: course.sfSymbol)
                                    .foregroundColor(Color(course.color))
                                Text(course.title)
                            }
                        }
                        .padding(.horizontal, ViewDefaults.listCellPadding)
                    }
                }

            }
        }
        .navigationTitle("Semesters")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: showSemesterEditor) {
                    Image(systemName: "plus")
                }
                
            }
        }
        .sheet(isPresented: $isEditorPresented) {
            NavigationView {
                SemesterEditorView(data: $data)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button(action: save) {
                                Text("Save")
                            }
                        }
                        
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: dismiss) {
                                Text("Dismiss")
                            }
                        }
                    }
            }
        }
    }
    
    private func showSemesterEditor() {
        isEditorPresented = true
    }
    
    private func dismiss() {
        isEditorPresented = false
    }
    
    private func save() {
        withAnimation {
            isEditorPresented = false
            semesters.append(Semester(using: data))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                data = Semester.Data()
            }
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
