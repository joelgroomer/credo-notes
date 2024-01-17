//
//  Note.swift
//  CredoNotes Watch App
//
//  Created by Joel Groomer on 1/16/24.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
