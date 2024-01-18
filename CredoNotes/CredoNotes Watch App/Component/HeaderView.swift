//
//  HeaderView.swift
//  CredoNotes Watch App
//
//  Created by Joel Groomer on 1/17/24.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title: String = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundStyle(.accent)
        } //: VStack
    }
}

// MARK: - PREVIEW
#Preview {
    HeaderView(title: "Credits")
}
