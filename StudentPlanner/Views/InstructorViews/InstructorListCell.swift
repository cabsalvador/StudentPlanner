//
//  InstructorListCell.swift
//  StudentPlanner
//
//  Created by Sal on 4/21/22.
//

import SwiftUI

struct InstructorListCell: View {
    let instructor: Instructor
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(.gray)
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(instructor.department)
                    .font(.caption)
                    .foregroundColor(.secondary)
                HStack {
                    Text(instructor.lastName)
                        .fontWeight(.bold)
                    Text(instructor.namesAreEmpty ? "No Name" : instructor.firstName)
                } .font(.title3)
                Text(instructor.title)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct InstructorListCell_Previews: PreviewProvider {
    static var previews: some View {
        InstructorListCell(instructor: SampleData.instructors[1])
            .previewLayout(.sizeThatFits)
            .frame(width: 400)
            .padding(2)
    }
}
