//
//  CourseClassEditorView.swift
//  StudentPlanner
//
//  Created by Sal on 4/22/22.
//

import SwiftUI

struct CourseClassEditorView: View {
    @State private var selection: String = "A"
    @State var options = ["A", "B", "C", "D", "E", "F", "G"]
    @State private var isToggled = false
    @State private var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 7)
    
    let cornerRadius: CGFloat = 5
    
    var body: some View {
        
        VStack {
            Picker("Test", selection: $selection) {
                ForEach(options, id: \.self) { item in
                    Text(item)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

struct CourseClassEditorView_Previews: PreviewProvider {
    static var previews: some View {
        CourseClassEditorView()
            .previewLayout(.sizeThatFits)
    }
}
