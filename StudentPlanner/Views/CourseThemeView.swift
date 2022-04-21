//
//  ContentView.swift
//  StudentPlanner
//
//  Created by Sal on 4/19/22.
//

import SwiftUI

struct CourseThemeView: View {
    @Binding var selectedSymbol: String
    @Binding var selectedColor: String
    
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 4)
    
    var body: some View {
        VStack {
            Image(systemName: selectedSymbol)
                .font(.system(size: 60))
                .foregroundColor(Color(selectedColor))
                .padding(.bottom)
                .frame(width: 100, height: 100)
            Divider()
            Section {
                LazyVGrid(columns: columns) {
                    ForEach(CourseTheme.colors, id: \.self) { color in
                        Button(action: { selectedColor = color }) {
                            Circle()
                                .frame(height: 50)
                                .padding(3)
                                .foregroundColor(Color(color))
                        }
                    }
                }
            } header: { HeaderText(title: "Colors") }
            Divider()
            Section {
                LazyVGrid(columns: columns) {
                    ForEach(CourseTheme.symbols, id: \.self) { sfSymbol in
                        Button(action: { selectedSymbol = sfSymbol }) {
                            Image(systemName: sfSymbol)
                                .foregroundColor(Color(selectedColor))
                                .font(.largeTitle)
                                .padding(3)
                        }
                    }
                }
            } header: { HeaderText(title: "Symbols") }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var image: some View {
        Image(systemName: selectedSymbol)
            .font(.system(size: 60))
            .foregroundColor(Color(selectedColor))
            .padding(.bottom)
            .frame(width: 100, height: 100)
    }
    
    var colorSection: some View {
        Section {
            LazyVGrid(columns: columns) {
                ForEach(CourseTheme.colors, id: \.self) { color in
                    Button(action: { selectedColor = color }) {
                        Circle()
                            .frame(height: 50)
                            .padding(3)
                            .foregroundColor(Color(color))
                    }
                }
            }
        } header: { HeaderText(title: "Colors") }
    }
    
    var symbolSection: some View {
        Section {
            LazyVGrid(columns: columns) {
                ForEach(CourseTheme.symbols, id: \.self) { sfSymbol in
                    Button(action: { selectedSymbol = sfSymbol }) {
                        Image(systemName: sfSymbol)
                            .foregroundColor(Color(selectedColor))
                            .font(.largeTitle)
                            .padding(3)
                    }
                }
            }
        } header: { HeaderText(title: "Symbols") }
    }
    
    private struct HeaderText: View {
        let title: String
        var body: some View {
            Text(title.uppercased())
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseThemeView(selectedSymbol: .constant(CourseTheme.randomSymbol()), selectedColor: .constant(CourseTheme.randomColor()))
                .padding()
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {}
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {}
                    }
                }
        }
    }
}

