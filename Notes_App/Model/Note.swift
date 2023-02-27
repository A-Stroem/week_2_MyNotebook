//
//  Note.swift
//  Notes_App
//
//  Created by Anders Strøm on 27/02/2023.
//

import Foundation
import UIKit

class Note: Identifiable {
    var id: String
    var title: String
    var text: String
    var imageURL: String?
    var image: UIImage?
    
    init(id: String, title: String, text: String, imageURL: String?, image: UIImage?) {
        self.id = id
        self.title = title
        self.text = text
        self.imageURL = imageURL
        self.image = image
    }
}
