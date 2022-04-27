//
//  SemesterListView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct SemesterListView: View {
    @StateObject var semestersVM: SemesterListVM
    
    init(dataService: DataServiceProtocol) {
        _semestersVM = StateObject(wrappedValue: SemesterListVM(dataService: dataService))
    }
    
    var body: some View {
        List {
            semesterlist
            
            
            ForEach(semestersVM.semesters) { semester in
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
        .navigationTitle("Semesters")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: semestersVM.showSemesterEditor) {
                    Image(systemName: "plus")
                }
                
            }
        }
        .sheet(isPresented: $semestersVM.isEditorPresented) {
            editorSheet
        }
    }
    
    private var semesterlist: some View {
        ForEach(semestersVM.semesters) { semester in
            NavigationLink(destination: SemesterDetailsView(semester: semester)) {
                SemesterCellView(semester: semester)
            }
        }
        .onDelete(perform: semestersVM.delete)
    }
    
    private var editorSheet: some View {
        NavigationView {
            SemesterEditorView(data: $semestersVM.data)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button(action: semestersVM.save) {
                            Text("Save")
                        }
                    }
                    
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: semestersVM.dismiss) {
                            Text("Dismiss")
                        }
                    }
                }
        }
    }
}

struct SemesterListView_Previews: PreviewProvider {
    static let dataService = TestDataService(data: Semester.sampleData)
    static var previews: some View {
        NavigationView {
            SemesterListView(dataService: dataService)
        }
    }
}
