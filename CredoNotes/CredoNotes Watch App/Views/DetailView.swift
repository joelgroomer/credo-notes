//
//  DetailView.swift
//  CredoNotes Watch App
//
//  Created by Joel Groomer on 1/17/24.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let note: Note
    let count: Int
    let index: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADER
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundStyle(.accent)
            
            // CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
            } //: HStack
            .foregroundStyle(.secondary)
            
        } //: VStack
    }
}

// MARK: - PREVIEW
#Preview {
    let sampleData: Note = Note(id: UUID(), text: "Hello, World!")
    return DetailView(note: sampleData, count: 5, index: 1)
}
