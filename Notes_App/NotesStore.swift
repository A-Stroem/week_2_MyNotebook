//
//  NotesStore.swift
//  Notes_App
//
//  Created by Anders Strøm on 14/02/2023.
//

import Foundation

// Class to store the notes and handle adding/saving notes
class NotesStore: ObservableObject {
    
    // Notes stored as an array of Note objects, with property wrapper to send updates to subscribers
    @Published var notes = [Note]()
    
    
    // Initialize the notes from UserDefaults data if it exists, else use an empty array
    init() {
        if let notesData = UserDefaults.standard.data(forKey: "notes") {
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: notesData) {
                notes = decodedNotes
            }
        }
    }
    
    // Add a new note to the notes array and save the updated array to UserDefaults
    func addNote(title: String, text: String) {
        let newNote = Note(title: title, text: text)
        notes.append(newNote)
        saveNotes()
    }
    
    // Save the notes array to UserDefaults, using JSONEncoder to encode the data
    func saveNotes() {
        if let encodedNotes = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodedNotes, forKey: "notes")
        }
    }
}
