//
//  SettingsView.swift
//  CredoNotes Watch App
//
//  Created by Joel Groomer on 1/17/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                if newValue > 0 {
                    self.value = newValue
                    self.lineCount = Int(newValue)
                }
            }), in: 0...4, step: 1)
                .tint(.accentColor)
        } //: VStack
        .onAppear {
            value = Float(lineCount)
        }
    }
}

// MARK: - PREVIEW
#Preview {
    SettingsView()
}
