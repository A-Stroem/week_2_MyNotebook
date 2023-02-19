//
//  Note.swift
//  Notes_App
//
//  Created by Anders Strøm on 14/02/2023.
//

import Foundation

class CloudNote: Codable {
    var id: String
    var title: String
    var text: String
    
    init(id: String, title: String, text: String) {
        self.id = id
        self.title = title
        self.text = text
    }
    
    init(title: String, text: String) {
        self.id = ""
        self.title = title
        self.text = text
    }
}

