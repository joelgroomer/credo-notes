//
//  ContentView.swift
//  CredoNotes Watch App
//
//  Created by Joel Groomer on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - FUNCTIONS
    func save() {
        dump(notes)
    }
    
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button {
                    // 1. Only run if text field is not emtpy
                    guard text.isEmpty == false else { return }
                    
                    // 2. Create a new note item with text value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. Append to notes array
                    notes.append(note)
                    
                    // 4. Clear text field
                    text = ""
                    
                    // 5. Save the notes
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundStyle(.accent)
            } //: HStack
            
            Spacer()
            
            Text("\(notes.count)")
        } //: VStack
        .navigationTitle("Notes")
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
