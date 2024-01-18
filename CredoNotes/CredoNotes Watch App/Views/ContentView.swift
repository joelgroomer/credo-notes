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
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data has failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Unable to load data")
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
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
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(
                                destination:
                                    DetailView(
                                        note: notes[i],
                                        count: notes.count,
                                        index: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }
                            } //: NavigationLink
                        } //: ForEach
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(25)
                } //: List
            } //: VStack
            .navigationTitle("Notes")
            .onAppear {
                load()
        }
        }
    }
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
