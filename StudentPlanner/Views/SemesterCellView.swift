//
//  SemesterCellView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct SemesterCellView: View {
    let semester: Semester
    var body: some View {
        HStack {
            Image(systemName: "graduationcap")
            
            VStack(alignment: .leading, spacing: 3) {
                Text(semester.title)
                    .font(.body)
                Text("\(semester.start.formatted(date: .long, time: .omitted))")
                    .font(.caption)
                Text("\(semester.end.formatted(date: .long, time: .omitted))")
                    .font(.caption)
            }
            .badge(semester.courses.count)
        }
    }
}

struct SemesterCellView_Previews: PreviewProvider {
    static var previews: some View {
        SemesterCellView(semester: Semester.sampleData[0])
            .previewLayout(.sizeThatFits)
    }
}
