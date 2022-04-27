//
//  MainView.swift
//  StudentPlanner
//
//  Created by Sal on 4/22/22.
//

import SwiftUI

struct MainView: View {
    let semesters: [Semester] = Semester.sampleData
    let instructors: [Instructor] = SampleData.instructors
    var body: some View {
        NavigationView {
        TabView {

                SemesterListView()
                    .tabItem {
                        Label("Semesters", systemImage: "graduationcap.fill")
                    }
                
                
                
                InstructorListView(instuctors: instructors)
                    .tabItem {
                        Label("Instructors", systemImage: "person.3.fill")
                    }
            }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
